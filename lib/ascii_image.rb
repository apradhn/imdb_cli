require 'json'
require 'open-uri'
require 'google-search/version'
require 'google-search/item'
require 'google-search/response'
require 'google-search/search'

class AsciiImage
  def image(query)
    results = []
    Google::Search::Image.new(:query => query).each do |image|
      results << image.uri
    end

    open(results.first) {|f|
      File.open("images/test.jpg","wb") do |file|
        file.puts f.read
      end
    }
  end
end
