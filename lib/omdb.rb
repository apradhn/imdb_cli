require 'open-uri'
require 'JSON'
require_relative "movie.rb"

class Omdb
  attr_accessor :movies
  def initialize
    @url = "http://www.omdbapi.com/?"
  end

  def search(query)
    search = open(@url + "s=#{query.gsub(" ", "%20")}&type=movie")
    @search_results = JSON.load(search)["Search"]
    @movies = @search_results.collect.with_index(1) do |result, i|
      movie = Movie.new
      movie.search_id = i
      movie.title = result["Title"]
      movie.year = result["Year"]
      movie.id = result["imdbID"]
      movie
    end
    print_search_results
  end

  def print_search_results
    @movies.each do |movie|
      puts "#{movie.search_id}: #{movie.title} (#{movie.year})"
    end
  end
end