require_relative '../lib/scraper.rb'
require_relative '../lib/omdb.rb'
scraper = Scraper.new
omdb = Omdb.new

omdb.search("boot")

