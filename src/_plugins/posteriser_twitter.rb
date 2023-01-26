# frozen_string_literal: true

require_relative "jekyll_posteriser"

require "base64"
require "net/http"
require "openssl"
require "securerandom"
require "uri"

using Posteriser::Refinements

module Posteriser
  module Services
    class Twitter
      def initialize(config)
        @endpoint = config[:endpoint]
        @consumer_key = config[:consumer_key]
        @consumer_secret = config[:consumer_secret]
        @oauth_token = config[:oauth_token]
        @oauth_secret = config[:oauth_secret]
      end

      def post(input)
        @method = "POST"

        content, attachment =
          if input["title"].empty?
            format(input["content_html"])
          else
            [input["title"] + " " + input["url"], nil]
          end

        body = Hash.new
        body[:status] = content
        body[:attachment_url] = attachment unless attachment.nil?

        request(body, oauth: { oauth_token: @oauth_token })
      end

      private def format(input)
        links = []

        formatter = lambda { |m| m[3] }
        content = input
          .unmention("twitter.com", formatter)
          .extract_links(links)
          .strip_html
          .decode_entities

        tweet_link = /^https:\/\/twitter\.com\/\w+\/status\/\d+/i
        attachment = nil
        links.each do |link|
          if link =~ tweet_link && attachment.nil?
            attachment = link
          else
            content.concat " ", link
          end
        end

        [content, attachment]
      end

      private def request(body, oauth: nil, query: {})
        unless oauth.nil?
          oauth[:oauth_consumer_key] = @consumer_key
          oauth[:oauth_nonce] = SecureRandom.urlsafe_base64(32)
          oauth[:oauth_signature_method] = "HMAC-SHA1"
          oauth[:oauth_timestamp] = Time.now.to_i
          oauth[:oauth_version] = "1.0"
          oauth[:oauth_signature] = sign(oauth.merge(body, query).sort)
        end

        api_uri =
          if query.empty?
            URI(@endpoint)
          else
            URI(@endpoint + "?" + query)
          end

        res = Net::HTTP.start(api_uri.host, api_uri.port, { use_ssl: true }) do |https|
          req =
            case @method
            when "GET"
              Net::HTTP::Get.new api_uri
            when "POST"
              Net::HTTP::Post.new api_uri
            end

          req.body = body.encode unless body.empty?

          unless oauth.nil?
            req["Authorization"] = "OAuth " + oauth.sort.reduce("") { |s, (k, v)|
              s + (s.empty? ? "" : ", ") + "#{k}=\"#{v.encode}\""
            }
          end

          req["Connection"] = "close"
          req["Content-Length"] = req.body&.length || 0
          req["Content-Type"] = "application/x-www-form-urlencoded" unless body.empty?

          https.request req
        end
      end

      private def sign(parameters)
        key = @consumer_secret + "&" + @oauth_secret
        message = [@method, @endpoint.encode, parameters.encode].join("&")
        Base64.strict_encode64(OpenSSL::HMAC.digest("sha1", key, message))
      end
    end
  end
end
