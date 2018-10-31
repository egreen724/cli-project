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
        @parade_data = "#{parade.css("span.parade a").text} - #{parade.css("span.time").text} - #{parade.css("span.parade a").attribute("href").value}"
       parades << @parade_data 
      end
    end 
    
    parades.each do |parade|
      new_parade = Parade.new 
      new_parade.title = parade.split(" - ")[0]
      new_parade.time = parade.split(" - ")[1]
      new_parade.url = "http://www.mardigrasneworleans.com" + parade.split(" - ")[2]
    end
  end
  
  def scrape_history_page(url)
    detail_page = Nokogiri::HTML(open(url))
    
    parade_title = detail_page.css("span#foobar").text 
    
    current_parade = Parade.find_by_title(parade_title)
    
    detail_page.css("div #content").each do |parade|
      current_parade.history = parade.css("div.pageRoute p").text
      current_parade.date = parade.css("div.purpleBar span.pTime").text.split(" ", 2)[1]
      current_parade.day = parade.css("div.purpleBar span.pTime").text.split(" ", 2)[0]
      current_parade.neighborhood = parade.css("div.purpleBar span[@itemprop = 'name']").text
      
      #parade.css("div.purpleBar time").attribute("datetime").value provides datetime datapoint  
    end
    
  end
end

#Scraper.new.scrape_schedule_page("http://www.mardigrasneworleans.com/schedule.html")
#Scraper.new.scrape_history_page("http://www.mardigrasneworleans.com/schedule/parade-info/parades-joan-of-arc.html")