require 'bundler'
require 'nokogiri'
require 'open-uri'
require 'date'

Bundler.require

require_all './lib/'

a=CryptoNews.new
