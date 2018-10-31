class CLI 
  
  def initialize  
    puts "Welcome to Mardi Gras 2019! Please use the choices below for more information about the parade schedule and events."
  end
  
  def make_parades 
    new_scrape = Scraper.new
    new_scrape.scrape_schedule_page("http://www.mardigrasneworleans.com/schedule.html")
  end
  
  def make_parade_details
    url_list = Parade.all.collect {|parade| parade.url}
    
    url_list.each do |page_url|
    new_scrape = Scraper.new
    new_scrape.scrape_history_page(page_url)
    end
  end
  
  def call
    make_parades
    make_parade_details
    menu
  end
  
  def menu  
    puts "Would you like to: see the full parade schedule (enter “full schedule”), see the parades by date (enter “by date”), or see the parades by neighborhood (enter “by neighborhood”)? To exit, type exit."
    
    input = gets.strip.to_s 
    
    case input 
    when "full schedule"
      list_parades
      parade_detail
      puts "\n"
      menu 
    when "by date"
      find_and_display_by_date
        #list dates; method to search and find by date
    when "by neighborhood"
        find_and_display_by_neighborhood 
        #list neighborhoods; method to find and display by neighborhood 
    when "exit"
      exit_method
    else
       puts "Please enter a valid option." 
       menu 
     end
  end
  
  def exit_method 
    puts "Thank you for exploring the Mardi Gras Parade schedule for 2019! Laissez les bons temps rouler!"
  end 
    
  def list_parades 
    @parade_list = Parade.all.sort{|a, b| a.date <=> b.date} 
    
    @parade_list.each_with_index do |parade, index|
      puts "#{index + 1}. #{parade.title} - #{parade.neighborhood} - #{parade.day}, #{parade.date} - #{parade.time}"
    end
  end
  
  def parade_detail
    puts "\n Enter the parade number to see more details."
    number_input = gets.strip.to_i 
    
    #@parade_list.all.sort{|a, b| a.title <=> b.title}
    
    puts "#{@parade_list[number_input - 1].title}, #{@parade_list[number_input - 1].date}, #{@parade_list[number_input - 1].time}, #{@parade_list[number_input - 1].neighborhood}"
    puts "\n #{@parade_list[number_input - 1].history}"
  end
  
   def find_and_display_by_neighborhood
    puts "Please enter the neighborhood where you would like to see a parade:"
    neighborhood_input = gets.strip  
    
    if neighborhood_input = Neighborhood.find_by_name(neighborhood_input)
      puts "#{neighborhood_input}" 
      neighborhood.parades.sort{|a, b| a.date <=> b.date}.each_with_index do |parade, index|
        puts "#{index + 1}. #{parade.title} - #{parade.day}, #{parade.date} - #{parade.time}"
       end 
      end 
    end

end