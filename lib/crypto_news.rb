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
    # lists websites with index
    input = gets.chomp
    while input != "exit"
      puts "Please select a website for today's news or type exit or back at any time."
      case input
      when input=1
        submenu(0)
      when input=2
        submenu(1)
      when input=3
        submenu(2)
      when input="back"
        # go back a level
      end
    end
  end

  def submenu(selection)
    this_site=websites[selection]
    puts "These are today's articles from #{this_site.name}"
    this_site.articles.each.with_index do |article|
      # list article with index
    end
    while input2 != "exit"
      puts "Please select an article from this website or type exit or back at any time."
      case input2
      when input2=1
        # open article number(0)
      when input2="back"
        # go back a level
      end
    end
  end

  def goodbye
    puts "Thanks for using Crypto News!"
  end

end
