require "base64"
require "date"
require "json"
require "net/http"
require "openssl"
require "securerandom"
require "uri"
require "yaml"

module TweeterRefinements
  refine String do
    def extract_links(links)
      link_pattern = /<a [^>]*?href="(https?:\/\/[^"]+)"[^>]*>/i
      self.scan(link_pattern) { |m| links.push $1 }
      self
    end

    def later?(comp)
      return true if comp.nil?
      DateTime.parse(self) > DateTime.parse(comp)
    end

    def strip_html
      self.gsub(/<\/?[^>]*>/, "")
    end

    def unmention(link_pattern, url_pattern)
      self.gsub(link_pattern) do |m|
        mention_link = $1
        mention_text = $2
        mention_link =~ url_pattern ? mention_text : mention_link
      end
    end
  end
end

using TweeterRefinements

module Tweeter
  class API
    def initialize(secrets)
      @consumer_key = secrets[:consumer_key]
      @consumer_secret = secrets[:consumer_secret]
      @oauth_token = secrets[:oauth_token]
      @oauth_secret = secrets[:oauth_secret]
    end

    def post(input)
      @endpoint = "https://api.twitter.com/1.1/statuses/update.json"
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
        url: /^twitter[.]com\/(\w[\w]*)$/i,
        tweet: /^https:\/\/twitter\.com\/\w+\/status\/\d+/i
      }
      links = []
      attachment = nil

      content = input
        .unmention(pattern[:link], pattern[:url])
        .extract_links(links)
        .strip_html

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

Jekyll::Hooks.register :site, :post_write do |site|
  config_file = "_tweeter.yaml"
  config = YAML.load_file(config_file, symbolize_names: true)
  service = Tweeter::API.new config[:secrets]

  feed = JSON.load_file "#{site.config["destination"]}/feed.json"
  fid = 1

  feed["items"].reverse.each do |item|
    next unless item["date_published"].later? config[:latest]

    sentinel_file = "_tweeter_#{fid}.pid"
    fid += 1

    pid = fork do
      sleep(fid * config[:sleep])
      exit unless File.file?(sentinel_file) && Process.pid.to_s == File.read(sentinel_file)

      service.post item

      config[:latest] = item["date_published"]
      File.write config_file, YAML.dump(config)

      File.unlink sentinel_file
    end

    Process.detach pid
    File.write sentinel_file, pid.to_s
  end
end
