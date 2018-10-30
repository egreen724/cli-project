require 'open-uri'
require 'pry'
require 'nokogiri'

#Scraping data from http://www.mardigrasneworleans.com/schedule.html

class Scraper
  
  attr_accessor :parade, :neighborhood
  
  def scrape_schedule_page(url)
    schedule = Nokogiri::HTML(open(url))
    
    neighborhoods = []
    parades = []
    
    schedule.css("ul.parades").each do |block|
      block.css("li.clickable").each do |parade|
        @parade_data = "#{parade.css("span.parade a").text} - #{parade.css("span.time").text}"
       parades << @parade_data 
      end
    end 
    
    parades.each do |parade|
      new_parade = Parade.new 
      new_parade.title = parade.split(" - ")[0]
      new_parade.time = parade.split(" - ")[1]
    end
    
    #Come back to this! Not scraping the right around)
    schedule.css("div.pageSchedule").each do |block|
      block.css("ul.parades").each do |parade|
        neighborhood = parade.css("li.listing-location").text 
      end
    end 
      
      #Not scraping the correct info 
      schedule.css("div.dates-wrapper").each do |date|
         date = date.css("div.dates").text 
      end 
      
  end
end

Scraper.new.scrape_schedule_page("http://www.mardigrasneworleans.com/schedule.html")