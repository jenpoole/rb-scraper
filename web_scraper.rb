require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'

# get request for url to be scraped
page = HTTParty.get('https://newyork.craigslist.org/search/pet')

# convert HTML string to Nokogiri object for data to be parsed
parse_page = Nokogiri::HTML(page)

# array to store each individual listing
pets_array = []

# Examine html content (in pry) using Nokogiri css method and element classes
# parse_page.css('.content').css('.row').css('.hdrlnk')

# parse the data
# convert headline text of each listing to a string & push to array
parse_page.css('.content').css('.row').css('.hdrlnk').map do |a|
    post_name = a.text
    pets_array.push(post_name)
end

# push array to CSV file
CSV.open('pets.csv', 'w') do |csv|
    csv << pets_array
end

# Pry.start(binding)