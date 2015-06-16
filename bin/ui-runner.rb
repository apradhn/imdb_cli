require_relative "../lib/user_interface.rb"
require "json"

ui = UserInterface.new

ui.welcome

ui.help

movie = Movie.new.tap do |movie|
  movie.title = "The Holy Mountain"
  movie.year = "1973"
  movie.runtime = "114 min"
  movie.genre = "Drama, Fantasy"
  movie.imdb_rating = "7.8"
  movie.plot = "In a corrupt, greed-fueled world, a powerful alchemist leads a Christ-like character and seven materialistic figures to the Holy Mountain, where they hope to achieve enlightenment."
end

tomatoes = Tomatoes.new.tap do |tomato|
  tomato.meter = "89"
  tomato.image = "certified"
  tomato.rating = "7.5"
  tomato.consensus = "Suspenseful and politically astute, Captain America: The Winter Soldier is a superior entry in the Avengers canon and is sure to thrill Marvel diehards."
end

ui.print_profile(movie)
ui.print_tomatoes(tomatoes, "Captain America: The Winter Soldier")
# ui.now_playing
# ui.opening
# ui.coming_soon