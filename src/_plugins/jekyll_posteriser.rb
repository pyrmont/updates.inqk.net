# frozen_string_literal: true

require "cgi"
require "date"
require "json"
require "uri"
require "yaml"

module Posteriser
  module Refinements
    refine Enumerable do
      def encode
        self.map do |k, v|
          URI.encode_www_form_component(k).gsub("+", "%20") + "=" + URI.encode_www_form_component(v).gsub("+", "%20")
        end.join("&")
      end
    end

    refine String do
      def decode_entities
        CGI.unescapeHTML(self)
      end

      def encode
        URI.encode_www_form_component(self).gsub("+", "%20")
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

      def unmention(local_domain, formatter)
        pattern = /<a [^>]*?href="https?:\/\/([^\/]+)([^"]+)"[^>]*>(@[^<]+)<\/a>/i
        self.gsub(pattern) do
          m = Regexp.last_match
          if local_domain.nil? || m[1] == local_domain
            formatter.call(m)
          else
            "#{m[1]}#{m[2]}"
          end
        end
      end
    end
  end
end

module Posteriser
  def self.services(config)
    return [] unless defined? Posteriser::Services
    @services ||=
      Posteriser::Services.constants.reduce(Array.new) do |acc, c|
        obj = Posteriser::Services.const_get(c)
        next acc unless obj.is_a?(Class)
        name = c.to_s.downcase.to_sym
        service_config = config[:services][name]
        next acc if service_config.nil? || service_config[:disabled]
        acc.push obj.new(service_config)
      end
  end
end

using Posteriser::Refinements

unless Jekyll.env == "posteriser_off"
  Jekyll::Hooks.register :site, :post_write do |site|
    config_file = "_posteriser.yaml"
    config = YAML.load_file(config_file, symbolize_names: true)
    feed = JSON.load_file "#{site.config["destination"]}/feed.json"
    feed["items"].reverse.each_with_index do |item, fid|
      next unless item["date_published"].later_than? config[:latest]
      sentinel_file = "_posteriser_#{fid}.pid"
      pid = fork do
        sleep(fid * config[:sleep])
        exit unless File.file?(sentinel_file) && Process.pid.to_s == File.read(sentinel_file)
        Posteriser.services(config).each { |service| service.post(item) }
        config[:latest] = item["date_published"]
        File.write config_file, YAML.dump(config)
        File.unlink sentinel_file
      end
      Process.detach pid
      File.write sentinel_file, pid.to_s
    end
  end
end
