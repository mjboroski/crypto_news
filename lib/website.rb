class Website
  attr_accessor :name, :url, :articles

  def initialize(link)
    @url=link
    @articles=[]
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
    send("#{director}")
  end

  def Coindesk
    site=Nokogiri::HTML(open(@url))
    site.search("div.main article").each do |article|
      puts "hello"
      title = article.search("a.fade").attr("title").strip
      url = article.search("a.fade").attr("href").strip
      date = article.search("p.timeauthor time").text.strip
      author = article.search("a.author").text.strip
      website=self.name
      this_article=Article.new(title,url,website,author,date)
      puts this_article
      @articles<<this_article
    end
    self.articles
  end

  def Cointelegraph
    puts "COINTELEGRAPH"
    # site=Nokogiri::HTML(open(@url))
  end

  def Ccn
    puts "CCN"
    # site=Nokogiri::HTML(open(@url))
  end

end
