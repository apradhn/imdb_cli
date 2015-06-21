class UserInterface
  attr_accessor :scraper, :omdb

  def initialize
    @scraper = Scraper.new
    @omdb = Omdb.new
    @showtimes = Showtimes.new
  end

  def call
    welcome
    help
    puts "Please enter a command"
    command = gets.strip
    while command != "exit"
      case command
      when "help"
        help
      when "opening"
        opening
      when "now playing"
        now_playing
      when "coming soon"
        coming_soon
      when "search"
        search
      else
        invalid
      end
      command = gets.strip
    end
    puts "Goodbye!"
  end

  def welcome
    puts "Welcome to IMDB CLI!"
  end

  def help
    puts "List of commands"
    puts "help --- show list of commands"
    puts "opening --- show movies opening this week"
    puts "now playing --- show movies playing this week"
    puts "coming soon --- show movies coming next week"
    puts "search --- search for a movie title"
    puts "exit --- close application"
    puts "______________________________________________"
  end

  def opening
    puts "Movies opening this week"
    puts @scraper.opening
  end

  def now_playing
    puts "Movies playing this week"
    puts @scraper.now_playing
    puts "Enter a movie title for showtimes, or 'back' to return to main menu"
    command = gets.strip
    while command != "back"
      @showtimes.showtimes(command)
      puts "Enter a movie title for showtimes, or 'back' to return to main menu"
      command = gets.strip
    end
    help
  end

  def coming_soon
    puts "Movies opening next week"
    puts @scraper.coming_soon
  end

  def search
    puts "Enter the name of the movie you want to look up"
    command = gets.strip
    @omdb.search(command)
    @omdb.print_search_results
    puts "Enter the number of the movie you want read about"
    command = gets.strip
    movie = @omdb.look_up(command)
    movie.print_attributes
    puts "Enter 'trailer' to watch trailer, 'tomatoes' for Rotten Tomatoes data, or 'back' to leave Search"
    command = gets.strip
    while command != "back"
      case command
        when "trailer"
          movie.youtube
        when "tomatoes"
          movie.tomatoes.print_attributes
      end
      puts "Enter 'trailer' to watch trailer, 'tomatoes' for Rotten Tomatoes data, or 'back' to leave Search"
      command = gets.strip
    end
    help
  end

  def invalid
    puts "That is not a valid command. Please try again"
  end
end
