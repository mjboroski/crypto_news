class Website

attr_accessor :name, :url,:top_article, :articles

  def initialize(link)
    @url=link
    get_name
  end

  def get_name
    site=Nokogiri::HTML(open(@url))
    title=site.css("title").text.split(" ")
    title=title.first.split(":") if title.first.include?(":")
    @name=title.first.chomp
  end

  def scrape

    # gets articles, top_article
  end


end
