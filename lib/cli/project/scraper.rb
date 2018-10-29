require 'open-uri'
require 'pry'
require 'nokogiri'

#Scraping data from http://www.mardigrasneworleans.com/schedule.html

class Scraper
  
  def scrape_schedule_page(url)
    schedule = Nokogiri::HTML(open(url))
    
    neighborhoods = []
    
    schedule.css("div.pageSchedule").each do |clickable|
      clickable.css("ul.clickable").each do |parade|
        binding.pry 
        title = parade.css("span.parade a").text 
        neighborhood = parade.css("li.listing-location").text 
        time = parade.css("span.time").text 
        date = parade.css("div.dates").text 
      binding.pry 
      end 
    end 
  end
end

Scraper.new.scrape_schedule_page("http://www.mardigrasneworleans.com/schedule.html")