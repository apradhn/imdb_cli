class Scraper
  attr_reader :doc

  def initialize
    @url = "http://www.imdb.com"
    html = open(@url)
    @doc = Nokogiri::HTML(html)
  end

  def opening
    @openings = @doc.at('.aux-content-widget-2:contains("Opening This Week")').css(".title a").text
  end

  def now_playing
    @now_playing = @doc.at('.aux-content-widget-2:contains("Now Playing (Box Office)")').css(".title a").text
  end

  def coming_soon
    @coming_soon = @doc.at('.aux-content-widget-2:contains("Coming Soon")').css(".title a").text
  end
end
