require 'nokogiri'
require 'open-uri'
require 'pry'
class Scraper
  attr_reader :doc

  def initialize
    @url = "http://www.imdb.com"
    html = open(@url)
    @doc = Nokogiri::HTML(html)
  end

  def opening
    scrape = @doc.at('.aux-content-widget-2:contains("Opening This Week")').css(".title a")
  end

  def now_playing
   scrape = @doc.at('.aux-content-widget-2:contains("Now Playing (Box Office)")').css(".title a")
  end

  def coming_soon
    scrape = @doc.at('.aux-content-widget-2:contains("Coming Soon")').css(".title a")
  end
end
