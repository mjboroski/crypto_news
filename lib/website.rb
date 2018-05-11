class Website
  include Sites
attr_accessor :name, :url,:top_article, :articles

  def initialize(link)
    @url=link
    get_name
    selector
  end

  def get_name
    site=Nokogiri::HTML(open(@url))
    title=site.css("title").text.split(" ")
    title=title.first.split(":") if title.first.include?(":")
    @name=title.first.chomp
  end

  def selector
    director=@name.downcase.capitalize
    send("#{director}(input?)")
  end

  def Coindesk

  end

  def Cointelegraph

  end

  def Ccn

  end

end
