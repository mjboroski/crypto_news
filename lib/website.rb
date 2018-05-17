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
    @site.search("div.main .article").each do |article|
      title = article.search("a.fade").attr("title").text
      url = article.search("a.fade").attr("href").text
      author = article.search("a.author").text
      website=self.name
      this_article=Article.new(title,url,website,author)
      @articles<<this_article
    end
    self.articles
  end

  def Cointelegraph
    @site.search("div#main .post").each do |article|
      title = article.search("a span.postTitle").text
      url = article.search("a").attr("href")
      author = article.search("a span.author").text
      website=self.name
      this_article=Article.new(title,url,website,author)
      @articles<<this_article
    end
    self.articles
  end

  def Ccn
    @site.search("div.posts-row article").each do |article|
      title = article.search("h4 a").text
      url = article.search("h4 a").attr("href").text
      author = "unlisted"
      website=self.name
      this_article=Article.new(title,url,website,author)
      @articles<<this_article
    end
    self.articles
  end

end
