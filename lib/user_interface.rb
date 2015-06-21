class UserInterface
  attr_accessor :scraper, :omdb
  attr_reader :commands, :command_descriptions
  include Printable::InstanceMethods


  def initialize
    @scraper = Scraper.new
    @omdb = Omdb.new
     @commands = {
      help: "show list of commands",
      opening: "show movies opening this week",
      now_playing:  "show movies playing this week",
      coming_soon: "show movies opening next week",
      search: "search for a movie title",
      exit: "close application"
     }
    @showtimes = Showtimes.new
  end

  def call
    welcome
    help
    prompt_user("Please enter a command (type \"help\" to see a list of commands)")
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
      prompt_user("Please enter a command (type \"help\" to see a list of commands)")
      command = gets.strip
    end
    print_line("Goodbye!")
  end

  def welcome
    print_heading("Welcome to IMDB CLI!", "#")
  end

  def help
    print_heading("List of Commands", " ")
    print_hash(commands)
  end

  def opening
    print_heading("Movies opening this week", "+")
    titles = @scraper.opening
    print_titles(titles)
  end

  def now_playing
    print_heading("Movies playing this week", "+")     
    print_titles(@scraper.now_playing)
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
    print_heading("Movies opening next week", "+") 
    titles = @scraper.coming_soon
    print_titles(titles)   
  end

  def search
    prompt_user("Enter the name of the movie you want to look up")
    command = gets.strip
    @omdb.search(command)
    print_search_results(command, @omdb)

    puts "Enter the number of the movie you want read about"
    command = gets.strip
    movie = @omdb.look_up(command)

    print_profile(movie)
    
    command = ""
    while command != "back" 
      puts parse_paragraph("Enter 'trailer' to watch trailer, 'tomatoes' for Rotten Tomatoes data, or 'back' to leave Search")
      print " " * 5         
      command = gets.strip
      if command == "trailer"
        movie.youtube
      elsif command == "tomatoes"
        print_tomatoes(movie.tomatoes, movie.title)
      end
    end
    help

  end

  def valid_command?(command, valid_commands)
    valid_commands.include?(command)
  end

  def get_search_results
    prompt_user("Enter the name of the movie you want to look up")
    command = gets.strip
    @omdb.search(command)
    print_search_results(command, @omdb)

    puts "Enter the number of the movie you want read about"
    command = gets.strip
    movie = @omdb.look_up(command)

    print_profile(movie)

    command = ""
    while command != "back"
      puts "Enter 'trailer' to watch trailer, 'tomatoes' for Rotten Tomatoes data, or 'back' to leave Search"
      command = gets.strip          
      case command
        when "trailer"
          movie.youtube
        when "tomatoes"
          print_tomatoes(movie.tomatoes, movie.title)  
      end
    end

    movie = @omdb.look_up(command)    
  end

  def invalid
    print_divider("! ")
    print_line("That is not a valid command. Please try again", {centered:true})
    print_divider("! ")
  end

end