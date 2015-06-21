class Omdb
  attr_accessor :movies
  def initialize
    @url = "http://www.omdbapi.com/?"
  end

  def search(query)
    search = open(@url + "s=#{query.gsub(" ", "%20")}&type=movie")
    json = JSON.load(search)["Search"]
    search_results(json)
  end

  def search_results(json)
    @search_results = json
    @movies = {}
    @search_results.collect.with_index(1) do |result, i|
      movie = Movie.new
      movie.title = result["Title"]
      movie.year = result["Year"]
      movie.id = result["imdbID"]
      @movies[i] = movie
    end

  end

  def look_up(id)
    movie = @movies[id.to_i]
    movie.json
    movie.tomatoes
    movie
  end
end
