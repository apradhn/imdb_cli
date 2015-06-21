module Printable
  WIDTH = 75
  PADDING = 5

  module InstanceMethods
    def print_divider(char="#")  
      puts " " * padding + char.ljust(width, char)
    end      
  end
end