class Showtimes
  attr_reader :doc

  def initialize
    @url = "http://www.google.com/movies?near=New+York%2C+NY"
    html = open(@url)
    @doc = Nokogiri::HTML(html)
  end

  def showtimes(movie_name)
    result_count = 0
    @doc.css('.theater').each { |theater|
      theater.css('.showtimes .movie').each { |movie|
        name = movie.css('.name').text
        if name.downcase == movie_name.downcase
          result_count += 1
          puts theater.css('h2.name').text
          movie.css('.times a').each {|time|
            puts time.text
          }
        end
      }
    }
    if (result_count < 1)
      puts "Sorry that title was not found. Please try again."
    end
  end
end
