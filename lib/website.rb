class Website
  attr_accessor :name, :url, :articles, :site

  def initialize(link)
    @url=link
    @articles=[]
    get_name
    selector
  end

  def get_name
    @site=Nokogiri::HTML(open(@url))
    title=site.css("title").text.split(" ")
    title=title.first.split(":") if title.first.include?(":")
    @name=title.first.chomp
  end

  def selector
    director=@name.downcase.capitalize
    send("#{director}")
  end

  def Coindesk
    a=Article.new("title a","http://www.google.com",self.name,"Bob",Date.today)
    b=Article.new("title b","poop.com",self.name,"Bob",Date.today)
    c=Article.new("title c","poop.com",self.name,"Bob",Date.today)
    d=Article.new("title d","poop.com",self.name,"Bob",Date.today)
    @articles<<a
    @articles<<b
    @articles<<c
    @articles<<d
    @site.search("div.main article").each do |article|
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
