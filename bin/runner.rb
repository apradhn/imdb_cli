require_relative '../lib/scraper.rb'
require_relative '../lib/omdb.rb'
require "pry"
scraper = Scraper.new
omdb = Omdb.new

omdb.search("boot")
movie = omdb.look_up("1")
puts movie.you_tube