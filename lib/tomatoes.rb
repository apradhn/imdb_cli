require_relative 'omdb.rb'

class Tomatoes
  attr_accessor :meter, :image, :rating, :consensus

  def initialize(json)
    @json = json
    set_attributes
  end

  def set_attributes
    @meter = @json["tomatoMeter"]
    @image = @json["tomatoImage"]
    @rating = @json["tomatoRating"]
    @consensus = @json["tomatoConsensus"]
  end

  def print_attributes
    puts "Tomato Meter: #{@meter}"
    puts "Tomato Image: #{@image}"
    puts "Tomato Rating: #{@rating}"
    puts "Tomato Consensus: #{@consensus}"
  end
end
