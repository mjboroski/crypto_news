class Article

  attr_accessor :title,:author,:date,:url,:website

  def initialize(title,url,website,author="none",date="none")
    @title=title
    @url=url
    @website=website
    @author=author
    @date=date
  end
end
