require_relative '../lib/scraper.rb'
require_relative '../lib/omdb.rb'
require_relative '../lib/user_interface.rb'

require "pry"
# scraper = Scraper.new
# omdb = Omdb.new

# omdb.search("back to the future")
# movie = omdb.look_up("1")
# puts movie.you_tube

ui = UserInterface.new

ui.call