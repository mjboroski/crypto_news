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

  end

  def goodbye

  end

end
