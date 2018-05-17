class Article

  attr_accessor :title,:author,:url,:website

  def initialize(title,url,website,author="unlisted")
    @title=title
    @url=url
    @website=website
    @author=author
  end
end
