require 'json'
require 'open-uri'
require 'pry'
require 'rmagick'
include 'Magick'

class AsciiImage

  def image(query)
    results = []
    Google::Search::Image.new(:query => query).each do |image|
      results << image.uri
    end
    # create_ascii(results.first)
    @source = results.first
    draw_ascii
  end

  def create_ascii(image)
    ascii = ASCII_Image.new(image)
    ascii.build(20)
  end

  def draw_ascii
    image = ImageList.new(@source)
  end
end
