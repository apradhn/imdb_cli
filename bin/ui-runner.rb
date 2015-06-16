require_relative "../lib/user_interface.rb"
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

# ui.print_profile(movie)
ui.now_playing
ui.opening
ui.coming_soon