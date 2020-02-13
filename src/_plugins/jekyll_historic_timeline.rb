module Jekyll
  class Timeline
    def initialize
      @timelines = Array.new
    end

    def partition(posts, size)
      timeline = nil

      posts.docs.each.with_index do |post, i|
        if i % size == 0
          timeline = Hash.new
          timeline[:posts] = Array.new
          timeline[:prev] = posts.docs[i - size] unless i - size < 0
          timeline[:next] = posts.docs[i + size] unless i + size >= posts.docs.size
          @timelines.push timeline
        end

        timeline[:posts].push post
      end
    end

    def generate(site)
      partition site.posts, site.config["max_posts"]

      @timelines.each do |timeline|
        data = { posts: timeline[:posts].reverse,
                 prev: timeline[:prev]&.date&.strftime("%s"),
                 next: timeline[:next]&.date&.strftime("%s"),
                 start: timeline[:posts].first.date.strftime("%s") }
        site.pages << TimelinePage.new(site, site.source, "timeline", data)
      end
    end
  end

  class TimelineGenerator < Generator
    def generate(site)
      Jekyll::Timeline.new.generate site
    end
  end

  class TimelinePage < Page
    def initialize(site, base, dir, data)
      @site = site
      @base = base
      @dir = dir
      @name = "#{data[:start]}.html"

      self.process @name
      self.read_yaml File.join(base, "_layouts"), "timeline.html"

      self.data["posts"] = data[:posts]
      self.data["begin"] = data[:posts].first.date
      self.data["end"] = data[:posts].last.date
      self.data["prev_tl"] = "#{data[:prev]}.html"
      self.data["next_tl"] = "#{data[:next]}.html"
    end
  end

  class TimelineTag < Liquid::Tag
    def render(context)
      site = context.registers[:site]
      cycles = site.posts.docs.size / site.config["max_posts"]
      time = site.posts.docs[cycles * site.config["max_posts"]].date.strftime("%s")
      "/timeline/#{time}.html"
    end
  end
end

Liquid::Template.register_tag("timeline_path", Jekyll::TimelineTag)
