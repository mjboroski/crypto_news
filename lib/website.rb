class Website

attr_accessor :name, :url,:top_article, :articles

  def initialize(link)
    @url=link
    get_name
    self.include_class
    scrape
  end

  def get_name
    site=Nokogiri::HTML(open(@url))
    title=site.css("title").text.split(" ")
    title=title.first.split(":") if title.first.include?(":")
    @name=title.first.chomp
  end

  def self.include_class
    send("self.included(Sites::#{@name.upcase}"))
  end
end
