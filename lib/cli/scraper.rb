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
  
  
  #css("div.pageRoute p").text history paragraph 
  #page-url css("span.parade a").attribute("href").value
  
  def scrape_history_page(url)
    detail_page = Nokogiri::HTML(open(url))
    
    parade_title = detail_page.css("span#foobar").text 
    
    current_parade = Parade.find_by_title(parade_title)
    
    detail_page.css("div #content").each do |parade|
      binding.pry 
      current_parade.history = parade.css("div.pageRoute p").text
      current_parade.date = parade.css("div.purpleBar span.pTime").text 
      current_parade.neighborhood = parade.css("div.purpleBar span[@itemprop = 'name']").text 
    end
    
  end
end

Scraper.new.scrape_schedule_page("http://www.mardigrasneworleans.com/schedule.html")
Scraper.new.scrape_history_page("http://www.mardigrasneworleans.com/schedule/parade-info/parades-joan-of-arc.html")