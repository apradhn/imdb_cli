require "open-uri"
require "json"

class Movie
  attr_accessor :title, :year, :id

  def json
    @id = id
    url = "http://www.omdbapi.com/?i="    
    response = open(url+id)
    json = JSON.load(response)
    puts json    
  end
end