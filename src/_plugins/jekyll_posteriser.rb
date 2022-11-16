require "base64"
require "cgi"
require "date"
require "json"
require "net/http"
require "openssl"
require "securerandom"
require "uri"
require "yaml"

module Posteriser
  module Refinements
    refine String do
      def decode_entities
        CGI.unescapeHTML(self)
      end

      def extract_links(links)
        link_pattern = /<a [^>]*?href="(https?:\/\/[^"]+)"[^>]*>/i
        self.scan(link_pattern) { |m| links.push $1 }
        self
      end

      def later_than?(comp)
        return true if comp.nil?
        DateTime.parse(self) > DateTime.parse(comp)
      end

      def strip_html
        self.gsub(/<\/?[^>]*>/, "")
      end

      def unmention(link_pattern, local_domain, formatter)
        self.gsub(link_pattern) do |m|
          mention_link = "#{m[1]}#{m[2]}"
          if domain.nil? || m[1] == local_domain
            formatter.call(m)
          else
            mention_link
          end
        end
      end
    end
  end
end

using Posteriser::Refinements

module Posteriser
  module Mastodon
    class API
      def initialize(config)
        @endpoint = config[:endpoint]
        @bearer_token = config[:bearer_token]
      end

      def post(input)
        @method = "POST"

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

      private def encode(data)
        if data.is_a? Enumerable
          data.map { |k, v|
            "#{encode_component(k)}=#{encode_component(v)}"
          }.join("&")
        else
          encode_component(data)
        end
      end

      private def encode_component(component)
        URI.encode_www_form_component(component).gsub("+", "%20")
      end

      private def format(input)
        pattern =/<a [^>]*?href="https?:\/\/([^\/]+)(\/[^"]+)"[^>]*>(@[^<]+)<\/a>/i
        formatter = lambda { |m| "#{m[3]}@#{m[1]}" }
        links = []

        content = input
          .unmention(pattern, nil, formatter)
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
          req =
            case @method
            when "GET"
              Net::HTTP::Get.new api_uri
            when "POST"
              Net::HTTP::Post.new api_uri
            end

          req.body = encode(body) unless body.empty?

          req["Authorization"] = "Bearer #{@bearer_token}"
          req["Connection"] = "close"
          req["Content-Length"] = req.body&.length || 0
          req["Content-Type"] = "application/x-www-form-urlencoded" unless body.empty?

          https.request req
        end
      end
    end
  end

  module Twitter
    class API
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

      private def encode(data)
        if data.is_a? Enumerable
          data.map { |k, v|
            "#{encode_component(k)}=#{encode_component(v)}"
          }.join("&")
        else
          encode_component(data)
        end
      end

      private def encode_component(component)
        URI.encode_www_form_component(component).gsub("+", "%20")
      end

      private def format(input)
        pattern = {
          link: /<a [^>]*?href="https?:\/\/([^"]*)"[^>]*>(@[^<]+)<\/a>/i,
          tweet: /^https:\/\/twitter\.com\/\w+\/status\/\d+/i
        }
        formatter = lambda { |m| m[3] }
        links = []
        attachment = nil

        content = input
          .unmention(pattern[:link], "twitter.com", formatter)
          .extract_links(links)
          .strip_html
          .decode_entities

        links.each do |link|
          if link =~ pattern[:tweet] && attachment.nil?
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

          req.body = encode(body) unless body.empty?

          unless oauth.nil?
            req["Authorization"] = "OAuth " + oauth.sort.reduce("") { |s, (k, v)|
              s + (s.empty? ? "" : ", ") + "#{k}=\"#{encode(v)}\""
            }
          end

          req["Connection"] = "close"
          req["Content-Length"] = req.body&.length || 0
          req["Content-Type"] = "application/x-www-form-urlencoded" unless body.empty?

          https.request req
        end
      end

      private def sign(parameters)
        base = encode parameters
        key = @consumer_secret + "&" + @oauth_secret
        message = [@method, encode(@endpoint), encode(base)].join("&")
        Base64.strict_encode64(OpenSSL::HMAC.digest("sha1", key, message))
      end
    end
  end
end

unless Jekyll.env == "posteriser_off"
  Jekyll::Hooks.register :site, :post_write do |site|
    config_file = "_posteriser.yaml"
    config = YAML.load_file(config_file, symbolize_names: true)
    twitter = Posteriser::Twitter::API.new config[:twitter]
    mastodon = Posteriser::Mastodon::API.new config[:mastodon]

    feed = JSON.load_file "#{site.config["destination"]}/feed.json"
    fid = 1

    feed["items"].reverse.each do |item|
      next unless item["date_published"].later_than? config[:latest]

      sentinel_file = "_posteriser_#{fid}.pid"
      fid += 1

      pid = fork do
        sleep(fid * config[:sleep])
        exit unless File.file?(sentinel_file) && Process.pid.to_s == File.read(sentinel_file)

        twitter.post item
        mastodon.post item

        config[:latest] = item["date_published"]
        File.write config_file, YAML.dump(config)

        File.unlink sentinel_file
      end

      Process.detach pid
      File.write sentinel_file, pid.to_s
    end
  end
end
