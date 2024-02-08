# frozen_string_literal: true

require_relative "jekyll_posteriser"

require "json"
require "net/http"
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
        record = Hash.new
        record[:text] = input["content_text"]
        record[:createdAt] = input["date_published"]
        body = Hash.new
        body[:repo] = @user_handle
        body[:collection] = "app.bsky.feed.post"
        body[:record] = record
        request(@post_endpoint, body)
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
