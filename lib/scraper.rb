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

  def scrape_opening
    @openings = @doc.at('.aux-content-widget-2:contains("Opening This Week")').css(".title a").text
  end

  def scrape_now_playing
    @now_playing = @doc.css(".aux-content-widget-2 .rhs-body .title a")[].text
  end
end
