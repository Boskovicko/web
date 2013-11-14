# encoding: utf-8
# http://realjenius.com/2012/12/01/jekyll-category-tag-paging-feeds/

require 'liquid'
require 'uri'

module URLEncoding
  def url_encode(url)
    url = url.downcase
    url = url.sub(%r{\s+}, "-");
    url = url.tr('příšerně žluťoučký kůň úpěl ďábelské ódy',
                 'priserne zlutoucky kun upel dabelske ody')
    return url
  end
end

module Jekyll

  class CatsAndTags < Generator

    safe true

    def generate(site)
      site.categories.each do |category|
        build_subpages(site, "rubriky", category)
      end

      site.tags.each do |tag|
        build_subpages(site, "temata", tag)
      end
    end

    def build_subpages(site, type, posts)
      posts[1] = posts[1].sort_by { |p| -p.date.to_f }
      paginate(site, type, posts)
    end

    def paginate(site, type, posts)
      pages = Pager.calculate_pages(posts[1], site.config['paginate'].to_i)
      (1..pages).each do |num_page|
        pager = Pager.new(site, num_page, posts[1], pages)
        path = "/#{type}/#{posts[0]}"
        if num_page > 1
          path = path + "/page#{num_page}"
        end
        newpage = GroupSubPage.new(site, site.source, path, type, posts[0])
        newpage.pager = pager
        site.pages << newpage

      end
    end
  end

  class GroupSubPage < Page
    include URLEncoding
    def initialize(site, base, dir, type, val)
      @site = site
      @base = base
      @dir = url_encode(dir)
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), "rubrika.html")
      self.data["grouptype"] = type
      self.data["title"] = val
    end
  end

end

Liquid::Template.register_filter(URLEncoding)
