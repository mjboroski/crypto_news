class Website

attr_accessor :name, :url,:top_article, :articles

  def initialize(link)
    @url=link
  end


  def scrape
    # gets articles, name, top_article
  end


end
