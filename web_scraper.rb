require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'Pry'
require 'csv'

# get request for url to be scraped
page = HTTParty.get('https://newyork.craigslist.org/search/pet')