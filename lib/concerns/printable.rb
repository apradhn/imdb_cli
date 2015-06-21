module Printable
  # Recommended to set with and padding to odd numbers
  WIDTH = 75
  PADDING = 5

  module InstanceMethods
    def print_divider(char="#")  
      puts " " * PADDING + char.ljust(WIDTH, char)
    end      

    def print_heading(message, char="#")
      print_divider(char+" ")
      puts " " * PADDING + char + " " * (WIDTH-2) + char
      puts " " * PADDING + char + message.center(WIDTH-2) + char
      puts " " * PADDING + char + " " * (WIDTH-2) + char   
      print_divider(char+" ") 
      puts ""   
    end  

    def parse_paragraph(text)
      text = " " * PADDING + text
      line_count = text.length / WIDTH
      line_count.times do |i| 
        text.insert(WIDTH * (i+1), "\n" + " " * PADDING)
      end
      text
    end 
    
    def print_titles(titles)
      titles.each_with_index do |t, i|
        puts " "*PADDING + "#{i+1}. #{t.text}"
        print_divider("-")
      end  
    end

    def print_list_item(label, item="", char=" ")
      if item != "" 
        puts (label.ljust(0.5 * WIDTH, char) + " " + item )  
      else
        puts " " * PADDING + label.ljust(0.5 * WIDTH)
        puts " " * PADDING + "-" * WIDTH
      end   
    end  
    
    def print_profile(movie)
      print_heading(movie.title)
      puts " " * PADDING +  "Year: #{movie.year}"
      puts " " * PADDING +  "Run Time: #{movie.runtime}"
      puts " " * PADDING +  "Genre(s): #{movie.genre}"
      puts " " * PADDING +  "IMDB Rating: #{movie.imdb_rating}"  
      print_divider("-") 
      puts parse_paragraph(movie.plot)
      print_divider("-")
    end  
    
    def print_tomatoes(tomatoes, title)
      print_heading(title)
      puts " " * PADDING + "Tomato Meter: #{tomatoes.meter}"
      puts " " * PADDING + "Tomato Image: #{tomatoes.image}"
      puts " " * PADDING + "Tomato Rating: #{tomatoes.rating}"
      print_divider("-")
      puts " " * PADDING + "Tomato Consensus:"
      puts parse_paragraph(tomatoes.consensus)
      print_divider("-")
      tomatoes.speak(tomatoes.consensus)
    end   

    def prompt_user(text)
      puts " "*PADDING + "Please enter a command (type \"help\" to see a list of commands)"
      print " "*PADDING
    end

    def print_line(text)
      puts " " * PADDING + text
    end

    def print_hash(hash)
      hash.each do |key, value|
        print_list_item(" " * PADDING + key.to_s.gsub("_", " ") + " ", " " + value, ". ")
      end
      print_divider("-")          
    end

  end
end