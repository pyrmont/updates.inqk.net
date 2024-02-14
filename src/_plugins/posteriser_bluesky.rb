# frozen_string_literal: true

require_relative "jekyll_posteriser"

require "gammo"
require "json"
require "net/http"
require "open-uri"
require "uri"

using Posteriser::Refinements

module Posteriser
  module Services
    class Bluesky
      def initialize(config)
        @user_handle = config[:user_handle]
        @app_password = config[:app_password]
        @session_endpoint = config[:session_endpoint]
        @post_endpoint = config[:post_endpoint]
        @upload_endpoint = config[:upload_endpoint]
      end

      def post(input)
        start_session
        content, embed =
          if input["title"].empty?
            format(input["content_html"])
          else
            [ input["title"], preview(input["url"]) ]
          end
        record = Hash.new
        record[:text] = content
        record[:createdAt] = input["date_published"]
        unless embed.nil?
          record[:embed] = { "$type" => "app.bsky.embed.external",
                             "external" => embed }
        end
        body = Hash.new
        body[:repo] = @user_handle
        body[:collection] = "app.bsky.feed.post"
        body[:record] = record
        request(@post_endpoint, body)
      end

      private def format(input)
        links = []
        formatter = lambda { |m| m[3] }
        content = input
          .unmention("bsky.app", formatter)
          .extract_links(links)
          .strip_html
          .decode_entities
        embed = preview(links.first)
        [ content, embed ]
      end

      private def preview(uri)
        return nil if uri.nil?
        URI.open(uri) do |page|
          html = page.read
          parser = Gammo.new(html)
          doc = parser.parse
          title_select = 'meta[property="og:title"],' +
                         'meta[name="twitter:title"]'
          title_fallback = "title"
          title = doc.css(title_select).first&.attributes&.[]("content") ||
                  doc.css(title_fallback).first&.inner_text
          desc_select = 'meta[property="og:description"],' +
                        'meta[name="twitter:description"],' +
                        'meta[name="description"]'
          desc = doc.css(desc_select).first&.attributes&.[]("content")
          return nil if title.nil? || desc.nil?
          { uri: uri, title: title, description: desc }
        end
      end

      private def request(endpoint, body, query: {})
        api_uri =
          if query.empty?
            URI(endpoint)
          else
            URI(endpoint + "?" + query)
          end
        res = Net::HTTP.start(api_uri.host, api_uri.port, { use_ssl: true }) do |https|
          req = Net::HTTP::Post.new api_uri
          req.body = JSON.generate(body)
          req["Accept"] = "application/json"
          req["Authorization"] = "Bearer #{@bearer_token}"
          req["Content-Type"] = "application/json"
          https.request req
        end
      end

      private def start_session
        api_uri = URI(@session_endpoint)
        res = Net::HTTP.start(api_uri.host, api_uri.port, { use_ssl: true }) do |https|
          req = Net::HTTP::Post.new api_uri
          req.body = JSON.generate({ identifier: @user_handle, password: @app_password })
          req["Accept"] = "application/json"
          req["Content-Type"] = "application/json"
          https.request req
        end
        raise "couldn't start session" unless res.code == "200"
        @bearer_token = JSON.parse(res.body).fetch("accessJwt")
      end
    end
  end
end
