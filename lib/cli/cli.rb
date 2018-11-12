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
    puts "\nMAIN MENU: \nWould you like to: see the full parade schedule (enter “full schedule”), see the parades by date (enter “by date”), or see the parades by neighborhood (enter “by neighborhood”)? To exit, type exit."
    
    input = gets.strip.to_s 
    
    case input 
    when "full schedule"
      list_parades
      parade_detail
      puts "\n"
      menu 
    when "by date"
      list_dates 
      display_by_date
      parade_detail_by_date
      puts "\n"
      menu 
    when "by neighborhood"
      list_neighborhoods
      display_parades_by_neighborhood 
      parade_detail_by_n
      puts "\n"
      menu 
    when "exit"
      exit_method
    else
       puts "Please enter a valid option.\n" 
       menu 
     end
  end
  
  def exit_method 
    puts "Thank you for exploring the Mardi Gras Parade schedule for 2019! Laissez les bons temps rouler!"
  end 
  
  
  def list_parades 
    @parade_list = Parade.all.sort{|a, b| a.date <=> b.date} 
    
     puts "FULL SCHEDULE\n"
     
    @parade_list.each_with_index do |parade, index|
      puts "#{index + 1}. #{parade.title} - #{parade.neighborhood} - #{parade.day}, #{parade.date} - #{parade.time}"
    end
  end

  def parade_detail
    puts "\n Enter the parade number to see more details."
    number_input = gets.strip.to_i 
    
    if number_input <= (@parade_list.length + 1)
      puts "#{@parade_list[number_input - 1].title}, #{@parade_list[number_input - 1].date}, #{@parade_list[number_input - 1].time}, #{@parade_list[number_input - 1].neighborhood}"
      puts "#{@parade_list[number_input - 1].history}"
    else 
     puts "Please enter a valid number."
     parade_detail
   end 
  end
  
  def list_dates 
    puts "\nALL DATES:"
    
     @date_list = Parade.all.uniq {|p| p.date}
    
     @date_list.each_with_index do |parade, index|
      puts "#{index + 1}. #{parade.day}, #{parade.date}"
    end
  end
  
  def display_by_date
    puts "Enter the number above to see all parades on that date."
    date_input = gets.strip.to_i
    
    
    if date_input <= (@date_list.length + 1)
      current_date = @date_list[date_input - 1]
      
       puts "#{current_date.date}\n"
      
      @parade_list_by_date = Parade.all.find_all {|parade| parade.date == current_date.date}
      
      @parade_list_by_date.each_with_index do |parade, index|
       puts "#{index + 1}. #{parade.title} - #{parade.neighborhood} - #{parade.time}"
        end 
    else 
      puts "Please enter a valid number.\n"
      display_by_date
    end 
  end
  
  def parade_detail_by_date
    puts "\nEnter the parade number to see more details."
    number_input = gets.strip.to_i 
    current_parade = @parade_list_by_date[number_input - 1]
    
    if number_input <= (@parade_list_by_date.length + 1)
      puts "\n#{current_parade.title}, #{current_parade.date}, #{current_parade.time}, #{current_parade.neighborhood}"
      puts "#{current_parade.history}"
    else 
      puts "Please enter a valid number."
      parade_detail_by_date
    end 
  end
  
  def list_neighborhoods
    puts "\nALL NEIGHBORHOODS:"
    
    @neighborhood_list = Neighborhood.all.uniq {|n| n.name}
   
    @neighborhood_list.each_with_index do |n, index|
      if n.name != ""
      puts "#{index + 1}. #{n.name}"
    end 
   end
  end
  
  def display_parades_by_neighborhood
    puts "Please enter the neighborhood number to see a list of parades in that area."
    neighborhood_input = gets.strip.to_i   
    
    if neighborhood_input <= (@neighborhood_list.length + 1) 
      current_neighborhood = @neighborhood_list[neighborhood_input - 1]
      
      puts "#{current_neighborhood.name}\n"
      
      @parade_list_by_n = Parade.all.find_all {|parade| parade.neighborhood == current_neighborhood.name}
      
      @parade_list_by_n.each_with_index do |parade, index|
       puts "#{index + 1}. #{parade.title} - #{parade.date} - #{parade.time}"
        end 
    else 
      puts "Please enter a valid number."
      display_parades_by_neighborhood
    end 
  end 
  
  def parade_detail_by_n
    puts "\nEnter the parade number to see more details."
    number_input = gets.strip.to_i
    
    if number_input <= (@parade_list_by_n.length + 1)
      puts "\n#{@parade_list_by_n[number_input - 1].title}, #{@parade_list_by_n[number_input - 1].date}, #{@parade_list_by_n[number_input - 1].time}, #{@parade_list_by_n[number_input - 1].neighborhood}"
      puts "\n#{@parade_list_by_n[number_input - 1].history}"
    else
      puts "Please enter a valid number."
      parade_detail_by_n
    end 
  end

end