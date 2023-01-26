# frozen_string_literal: true

require_relative "jekyll_posteriser"

require "net/http"
require "uri"

using Posteriser::Refinements

module Posteriser
  module Services
    class Mastodon
      def initialize(config)
        @endpoint = config[:endpoint]
        @bearer_token = config[:bearer_token]
      end

      def post(input)
        content =
          if input["title"].empty?
            format(input["content_html"])
          else
            input["title"] + " " + input["url"]
          end
        body = Hash.new
        body[:status] = content
        request(body)
      end

      private def format(input)
        links = []
        formatter = lambda { |m| "#{m[3]}@#{m[1]}" }
        content = input
          .unmention(nil, formatter)
          .extract_links(links)
          .strip_html
          .decode_entities
        links.each do |link|
          content.concat " ", link
        end
        content
      end

      private def request(body, query: {})
        api_uri =
          if query.empty?
            URI(@endpoint)
          else
            URI(@endpoint + "?" + query)
          end
        res = Net::HTTP.start(api_uri.host, api_uri.port, { use_ssl: true }) do |https|
          req = Net::HTTP::Post.new api_uri
          req.body = body.encode unless body.empty?
          req["Authorization"] = "Bearer #{@bearer_token}"
          req["Connection"] = "close"
          req["Content-Length"] = req.body&.length || 0
          req["Content-Type"] = "application/x-www-form-urlencoded" unless body.empty?
          https.request req
        end
      end
    end
  end
end
