require 'open-uri'
require 'pry'
require 'nokogiri'

#Scraping data from http://www.mardigrasneworleans.com/schedule.html

class Scraper
  
  def scrape_schedule_page(url)
    schedule = Nokogiri::HTML(open(url))
    
    neighborhoods = []
    parades = []
    
    schedule.css("ul.parades").each do |block|
      block.css("li.clickable").each do |parade|
        title = parade.css("span.parade a").text 
        neighborhood = parade.css("li.listing-location").text 
        time = parade.css("span.time").text 
      end
    end 
    
    schedule.css("div.pageSchedule").each do |block|
      block.css("ul.parades").each do |parade|
        neighborhood = parade.css("li.listing-location").text 
        binding.pry
      end
    end 
      
      schedule.css("div.dates-wrapper").each do |date|
         date = date.css("div.dates").text 
      end 
      binding.pry 
      
  end
end

Scraper.new.scrape_schedule_page("http://www.mardigrasneworleans.com/schedule.html")