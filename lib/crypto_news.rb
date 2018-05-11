class CryptoNews
  @@list=["https://www.coindesk.com/","https://cointelegraph.com/","https://www.ccn.com/"]
  attr_accessor :websites

  def initialize
    @websites=[]
    runtime
  end

  def runtime
    greeting
    create
    menu
    goodbye
  end

  def greeting
    puts "Welcome to Crypto News!!!"
    puts "Today is #{Date.today}."
  end

  def create
    @@list.each do |link|
      website=Website.new(link)
      website.scrape
      @websites<<website
    end
  end

  def menu
    puts "Please select a website for today's news or type exit."
    @websites.each.with_index(1) do |website, i|
      puts "#{i}. #{website.name}"
    end
    input = gets.chomp
    while input != "exit"
      case input
      when input=1
        submenu(0)
      when input=2
        submenu(1)
      when input=3
        submenu(2)
      end
    end
  end

  def submenu(selection)
    this_site=websites[selection]
    puts "These are today's articles from #{this_site.name}:"
    this_site.articles.each.with_index do |article, i|
      puts "#{i}. #{article.title}"
    end
    while input2 != "exit"
      puts "Please select an article from this website or type exit or back."
      if input2.to_i>0
        start this_site.articles[(input2-1)].url
      elsif input2=="back"
        menu
      end
    end
  end

  def goodbye
    puts "Thanks for using Crypto News!"
  end

end
