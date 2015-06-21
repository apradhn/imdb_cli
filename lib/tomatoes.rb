class Tomatoes
  attr_accessor :meter, :image, :rating, :consensus

  def initialize(json="")
    @json = json
    set_attributes
  end

  def set_attributes
    @meter = @json["tomatoMeter"]
    @image = @json["tomatoImage"]
    @rating = @json["tomatoRating"]
    @consensus = @json["tomatoConsensus"]
  end

  def speak(message)
    system("say", message)
  end
  
end
