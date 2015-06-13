require "open-uri"
require "json"
require "pry"

class Movie
  attr_accessor :title, :year, :id, :runtime, :genre, :director, :writer, :actors,
  :imdb_rating, :plot

  def json
    @id = id
    url = "http://www.omdbapi.com/?i="    
    response = open(url+id)
    json = JSON.load(response)
    @runtime = json["Runtime"]
    @genre = json["Genre"]
    @director = json["Director"]
    @writer = json["Writer"]
    @actors = json["Actors"]
    @imdb_rating = json["imdbRating"]
    @plot = json["Plot"]
  end

  def print_attributes
    puts "Title: #{@title}"
    puts "Year: #{@year}"
    puts "Runtime: #{@runtime}"
    puts "Genre: #{@genre}"
    puts "IMDB rating: #{@imdb_rating}"
    puts "Plot: #{@plot}"
  end

  def you_tube
    url = "https://www.youtube.com/results?search_query="
    response = open(url + "#{@title.gsub(" ", "+")}+trailer")
    doc = Nokogiri::HTML(response)
    doc = doc.css("#results .section-list .item-section li").first
    href = doc.css(".yt-lockup-title a").attribute("href")
    system("open", "https://www.youtube.com" + href)
  end

end