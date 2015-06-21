require_relative "omdb.rb"
require_relative "scraper.rb"
require_relative "movie.rb"
require_relative "../config/environment.rb"
require_relative "concerns/printable.rb"

class UserInterface
  attr_accessor :scraper, :omdb
  attr_reader :commands, :command_descriptions
  include Printable::InstanceMethods


  def initialize
    @scraper = Scraper.new
    @omdb = Omdb.new
    # @commands = ["help", "opening", "now playing", "coming soon", "search", "exit"]
    # @command_descriptions = ["show list of commands", "show movies opening this week",
    #  "show movies playing this week", "show movies opening next week", "search for a movie title",
    #  "close application"]
     @commands = {
      help: "show list of commands",
      opening: "show movies opening this week",
      now_playing:  "show movies playing this week",
      coming_soon: "show movies opening next week",
      search: "search for a movie title",
      exit: "close application"
     }
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
    titles = @scraper.now_playing
    print_titles(titles)
  end

  def coming_soon
    print_heading("Movies opening next week", "+") 
    titles = @scraper.coming_soon
    print_titles(titles)   
  end

  def search
    movie = get_search_results
    print_profile(movie)

    command = ""
    valid_commands = ["back", "trailer", "tomatoes"]
    while command != "back" 
      puts parse_paragraph("Enter 'trailer' to watch trailer, 'tomatoes' for Rotten Tomatoes data, or 'back' to leave Search")
      print " " * padding         
      command = gets.strip
      if command == "trailer"
        movie.youtube
      elsif command == "tomatoes"
        print_tomatoes(movie.tomatoes, movie.title)
      elsif !(valid_command?(command, valid_commands))
        invalid
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

    print_search_results(command, @omdb)

    prompt_user("Enter the number of the movie you want to read about")
    command = gets.strip  
    while command.to_i == 0
      invalid
      command = gets.strip
    end

    movie = @omdb.look_up(command)    
  end

  def invalid
    print_divider("! ")
    print_line("That is not a valid command. Please try again", {centered:true})
    print_divider("! ")
  end

end