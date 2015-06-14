require 'json'
require 'open-uri'
require 'pry'

class Magick

  class Quantum_Depth

  end

end

class AsciiImage
  def image(query)
    results = []
    Google::Search::Image.new(:query => query).each do |image|
      results << image.uri
    end
    create_ascii(results.first)
  end

  def create_ascii(image)
    ascii = ASCII_Image.new(image)
    ascii.build(20)
  end
end
