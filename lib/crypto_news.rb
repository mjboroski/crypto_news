require "crypto_news/version"

class CryptoNews

attr_accessor :websites

  def runtime
    greeting
    site_scraper
    menu
    goodbye
  end

  def greeting
    puts "Welcome to Crypto News!!!"
    puts "Today is #{todays_date}."
  end

  def site_scraper
    @websites.each do |website|
      # scrape website name, url, and top article
    end
  end

  def menu
    # lists websites with index
    puts "Please select a website for today's news or type exit or back at any time."
    input = gets.chomp
    while input != "exit"
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

  def submenu(selection)
    this_site=websites[selection]
    puts "These are today's articles from #{this_site.name}"

  end

  def goodbye
    puts "Thanks for using Crypto News!"
  end

end
