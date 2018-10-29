require 'open-uri'
require 'pry'
require 'nokogiri'

#Scraping data from http://www.mardigrasneworleans.com/schedule.html

class Scraper
  
  def Self.scrape_schedule_page(schedule_url)
    schedule = Nokogiri::HTML(open(schedule_url))
    
    
  end
  
end