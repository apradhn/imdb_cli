require 'open-uri'
require 'JSON'

class Omdb
  def initialize
    @url = "http://www.omdbapi.com/?"
  end

  def search(query)
    search = open(@url + "s=#{query.gsub(" ", "%20")}")
    @search_results = JSON.load(search)["Search"]
    print_search_results
  end

  def print_search_results
    @search_results.each { |result|
      puts result["Title"]
    }
  end
end