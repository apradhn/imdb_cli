module Printable
  WIDTH = 75
  PADDING = 5

  module InstanceMethods
    def print_divider(char="#")  
      puts " " * padding + char.ljust(width, char)
    end      

    def print_heading(message, char="#")
      print_divider(char+" ")
      puts " " * padding + char + " " * (width-2) + char
      puts " " * padding + char + message.center(width-2) + char
      puts " " * padding + char + " " * (width-2) + char   
      print_divider(char+" ") 
      puts ""   
    end  

    def parse_paragraph(text)
      text = " " * padding + text
      line_count = text.length / width
      line_count.times do |i| 
        text.insert(width * (i+1), "\n" + " " * padding)
      end
      text
    end 
    
    def print_titles(titles)
      titles.each_with_index do |t, i|
        puts " "*padding + "#{i+1}. #{t.text}"
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

  end
end