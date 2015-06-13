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
    @movies = {}
    @search_results.collect.with_index(1) do |result, i|
      movie = Movie.new
      movie.title = result["Title"]
      movie.year = result["Year"]
      movie.id = result["imdbID"]
      @movies[i] = movie
    end
  end

  def print_search_results
    @movies.each do |id, movie|
      puts "#{id}: #{movie.title}"
    end
  end

  def look_up(id)
    @movies[id.to_i]
  end
end