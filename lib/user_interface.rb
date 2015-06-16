require_relative "omdb.rb"
require_relative "scraper.rb"
require_relative "movie.rb"
require "pry"

class UserInterface
  attr_accessor :scraper, :omdb, :width

  def initialize
    @scraper = Scraper.new
    @omdb = Omdb.new
    @width = 75;
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
    message = "Welcome to IMDB CLI!"
    padding = ((self.width - message.length) / 2) - 1
    puts "#" * self.width
    puts "#" + " "*(self.width-2) + "#"
    puts "#" + " " * padding + message + " " * padding + "#"
    puts "#"+ " "*(self.width-2) + "#"
    puts "#"*self.width
  end

  def help
    puts " "*self.width
    commands = ["help", "opening", "now playing", "coming soon", "search", "exit"]
    descriptions = ["show list of commands", "show movies opening this week",
     "show movies playing this week", "show movies opening next week", "search for a movie title",
     "close application"]
    puts "<-- List of commands -->".center(self.width)
    commands.each.with_index do |command, i|
      print_list_item("+ " + commands[i], descriptions[i] + " +")
    end
  end

  def print_list_item(command, description)
    padding = self.width - (command.length + description.length)  
    puts command.ljust(padding + command.length) + description      
  end

  def opening
    puts "Movies opening this week"
    puts @scraper.opening
  end

  def now_playing
    puts "Movies playing this week"
    puts @scraper.now_playing
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