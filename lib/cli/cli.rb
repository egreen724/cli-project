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
      display_by_date
      parade_detail_by_date
      puts "\n"
      menu 
    when "by neighborhood"
      list_neighborhoods
      display_parades_by_neighborhood 
      puts "\n"
      menu 
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
    
    puts "#{@parade_list[number_input - 1].title}, #{@parade_list[number_input - 1].date}, #{@parade_list[number_input - 1].time}, #{@parade_list[number_input - 1].neighborhood}"
    puts "\n #{@parade_list[number_input - 1].history}"
  end
  
  def display_by_date
    puts "What date would you like to attend a parade? (range: Jan 06 - Mar 05)"
    date_input = gets.strip
    
    puts "#{date_input}\n"
    
    @date_list = Parade.all.find_all {|p| p.date == date_input}
    
    @date_list.each_with_index do |parade, index|
    puts "#{index + 1}. #{parade.title} - #{parade.neighborhood} - #{parade.time}"
    end 
  end
  
  def parade_detail_by_date
    puts "\nEnter the parade number to see more details."
    number_input = gets.strip.to_i 
    
    puts "\n#{@date_list[number_input - 1].title}, #{@date_list[number_input - 1].date}, #{@date_list[number_input - 1].time}, #{@date_list[number_input - 1].neighborhood}"
    puts "\n#{@date_list[number_input - 1].history}"
  end
  
  def list_neighborhoods
    @neighborhood_list = Neighborhood.all.uniq {|n| n.name}
    @neighborhood_list.each_with_index do |n, index|
      puts "#{index + 1}. #{n.name}"
    end 
  end
  
  def display_parades_by_neighborhood
    puts "Please enter the neighborhood number to see a list of parades."
    neighborhood_input = gets.strip.to_i   
    
    current_neighborhood = @neighborhood_list[neighborhood_input - 1]
    
    puts "#{current_neighborhood.name}\n"
    
    parade_list = Parade.all.find_all {|parade| parade.neighborhood == current_neighborhood.name}
    
    parade_list.each_with_index do |parade, index|
     puts "#{index + 1}. #{parade.title} - #{parade.date} - #{parade.time}"
    end 
  end 
    # current_neighborhood.parades.each_with_index do |parade, index|
    # puts "#{index + 1}. #{parade.title} - #{parade.date} - #{parade.time}"
     # end 
    
    # if Neighborhood.find_by_name(neighborhood_input) == neighborhood_input 
    #   binding.pry 
    #   current_neighborhood = Neighborhood.find_by_name(neighborhood_input)
    #   neighborhood_list = current_neighborhood.parades.sort{|a, b| a.date <=> b.date}
      
    #   neighborhood_list.each_with_index do |parade, index|
    #     puts "#{index + 1}. #{parade.title} - #{parade.day}, #{parade.date} - #{parade.time}"
    #     binding.pry 
    #   end 
    # else 
    #   puts "Please enter an accurate name."
    #   end 
  

end