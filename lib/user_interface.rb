require_relative "omdb.rb"
require_relative "scraper.rb"
require_relative "movie.rb"
require_relative "../config/environment.rb"

class UserInterface
  attr_accessor :scraper, :omdb, :width, :padding
  attr_reader :commands, :command_descriptions

  def initialize
    @scraper = Scraper.new
    @omdb = Omdb.new
    @width = 101; # recommended to set width to an odd number
    @padding = 5;
    @commands = ["help", "opening", "now playing", "coming soon", "search", "exit"]
    @command_descriptions = ["show list of commands", "show movies opening this week",
     "show movies playing this week", "show movies opening next week", "search for a movie title",
     "close application"]
  end

  def call
    welcome
    help
    prompt_user
    # puts "Please enter a command"
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
      prompt_user
      command = gets.strip
    end
    puts " " * padding + "Goodbye!"
  end

  def welcome
    print_heading("Welcome to IMDB CLI!", "#")
  end

  def help
    print_heading("List of Commands", " ")
    commands.each.with_index do |command, i|
      print_list_item(" " * padding + commands[i] + " ", " " + command_descriptions[i], ". ")
    end
    print_divider("-")
  end

  def prompt_user
    puts " "*padding + "Please enter a command (type \"help\" to see a list of commands)"
    print " "*padding
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
    puts " " * padding + "Enter the name of the movie you want to look up".ljust(width - padding)
    print " " * padding
    command = gets.strip
    print_search_results(command)

    puts " " * padding + "Enter the number of the movie you want to read about".ljust(width - padding)
    print " " * padding    
    command = gets.strip  
    # binding.pry
    while command.to_i == 0
      invalid
      command = gets.strip
    end

    movie = @omdb.look_up(command)    
  end

  def invalid
    print_divider("! ")
    puts "That is not a valid command. Please try again".center(width + padding*2)
    print_divider("! ")
    print " "*padding
  end

  def print_tomatoes(tomatoes, title)
    print_heading(title)
    puts " " * padding + "Tomato Meter: #{tomatoes.meter}"
    puts " " * padding + "Tomato Image: #{tomatoes.image}"
    puts " " * padding + "Tomato Rating: #{tomatoes.rating}"
    print_divider("-")
    puts " " * padding + "Tomato Consensus:"
    puts parse_paragraph(tomatoes.consensus)
    print_divider("-")
    tomatoes.speak(tomatoes.consensus)
  end  

  def print_profile(movie)
    print_heading(movie.title)
    puts " " * padding +  "Year: #{movie.year}"
    puts " " * padding +  "Run Time: #{movie.runtime}"
    puts " " * padding +  "Genre(s): #{movie.genre}"
    puts " " * padding +  "IMDB Rating: #{movie.imdb_rating}"  
    print_divider("-") 
    puts parse_paragraph(movie.plot)
    print_divider("-")
  end

  def print_search_results(command)
    @omdb.search(command)
    @omdb.movies.each do |id, movie|
      puts " " * padding + "#{id}: #{movie.title} (#{movie.year})"
      print_divider("-")
    end     
  end  

  def print_list_item(label, item="", char=" ")
    if item != "" 
      puts (label.ljust(0.5 * width, char) + " " + item )  
    else
      puts " " * padding + label.ljust(0.5 * width)
      puts " " * padding + "-" * width
    end   
  end

  def print_titles(titles)
    titles.each_with_index do |t, i|
      puts " "*padding + "#{i+1}. #{t.text}"
      print_divider("-")
    end  
  end

  def print_heading(message, char="#")
    print_divider(char+" ")
    puts " " * padding + char + " " * (width-2) + char
    puts " " * padding + char + message.center(width-2) + char
    puts " " * padding + char + " " * (width-2) + char   
    print_divider(char+" ") 
    puts ""   
  end  

  def print_divider(char="#")  
    puts " " * padding + char.ljust(width, char)
  end  

  def parse_paragraph(text)
    text = " " * padding + text
    line_count = text.length / width
    line_count.times do |i| 
      text.insert(width * (i+1), "\n" + " " * padding)
    end
    text
  end

  def clear_screen
    system("clear")
  end
end