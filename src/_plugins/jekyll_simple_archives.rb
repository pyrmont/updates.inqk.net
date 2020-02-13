module Jekyll
  class Archives
    def initialize
      @categories = Hash.new { |h,k| h[k] = Hash.new { |i,l| i[l] = Array.new } }
    end

    def categorise(posts)
      posts.docs.each do |post|
        post.data["categories"].each do |category|
          @categories[category][post.date.strftime("%Y")].push post
        end
      end
    end

    def generate(site)
      categorise site.posts

      @categories.each do |category,years|
        years.each do |year,posts|
          data = { category: category, name: category.capitalize,
                   years: years.keys, year: year, posts: posts }
          site.pages << ArchivePage.new(site, site.source, category, data)
        end
      end
    end
  end

  class ArchiveGenerator < Generator
    def generate(site)
      Jekyll::Archives.new.generate site
    end
  end

  class ArchivePage < Page
    def initialize(site, base, dir, data)
      @site = site
      @base = base
      @dir = dir
      @name = "#{data[:year]}.html"

      self.process @name
      self.read_yaml File.join(base, "_layouts"), "category.html"

      self.data["category"] = data[:name]
      self.data["years"] = data[:years]
      self.data["year"] = data[:year]
      self.data["posts"] = data[:posts]
      self.data["title"] = "#{data[:name]} - #{data[:year]}"
    end
  end
end
