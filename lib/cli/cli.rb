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
    puts "\nMAIN MENU: \nWould you like to: 1). see the full parade schedule (enter “1”), 2). see the parades by date (enter “2”), or 3). see the parades by neighborhood (enter “3”)? To exit, type exit."
    
    input = gets.strip
    
    case input 
    when "1"
      list_parades
      parade_detail
      puts "\n"
      menu 
    when "2"
      list_dates 
      display_by_date
      parade_detail_by_date
      puts "\n"
      menu 
    when "3"
      list_neighborhoods
      display_parades_by_neighborhood 
      #parade_detail_by_n
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
  
     puts "FULL SCHEDULE\n"
     
    Parade.sorted.each_with_index do |parade, index|
      puts "#{index + 1}. #{parade.title} - #{parade.neighborhood.name} - #{parade.day}, #{parade.date} - #{parade.time}"
    end
  end

  def parade_detail
    puts "\n Enter the parade number to see more details."
    number_input = gets.strip.to_i 
    
    if number_input <= (Parade.all.length) && number_input > 0 
      current_parade = Parade.sorted[number_input - 1]
      
      puts "#{current_parade.title}, #{current_parade.date}, #{current_parade.time}, #{current_parade.neighborhood.name}"
      puts "#{current_parade.history}"
    else 
     puts "Please enter a valid number."
     parade_detail
   end 
  end
  
  def list_dates 
    puts "\nALL DATES:"
    
    Parade.parade_dates.each_with_index do |parade, index|
      puts "#{index + 1}. #{parade.day}, #{parade.date}"
    end
  end
  
  def display_by_date
    puts "Enter the number above to see all parades on that date."
    date_input = gets.strip.to_i
    
    if date_input <= (Parade.parade_dates.length) && date_input > 0
      current_date = Parade.parade_dates[date_input - 1]
      
       puts "#{current_date.date}\n"
     
      Parade.find_by_date(current_date).each_with_index do |parade, index|
       puts "#{index + 1}. #{parade.title} - #{parade.neighborhood.name} - #{parade.time}"
        end 
    else 
      puts "Please enter a valid number.\n"
      display_by_date
    end 
  end
  
  def parade_detail_by_date
    puts "\nEnter the parade number to see more details."
    number_input = gets.strip.to_i 
    current_parade = Parade.find_by_date(current_date)[number_input - 1]
    
    if number_input <= (Parade.find_by_date(current_date).length) && number_input > 0 
      puts "\n#{current_parade.title}, #{current_parade.date}, #{current_parade.time}, #{current_parade.neighborhood.name}"
      puts "#{current_parade.history}"
    else 
      puts "Please enter a valid number."
      parade_detail_by_date
    end 
  end
  
  def list_neighborhoods
    puts "\nALL NEIGHBORHOODS:"
    
    #@neighborhood_list = Neighborhood.all.uniq {|n| n.name}
   
    Neighborhood.all.each_with_index do |n, index|
      if n.name != ""
      puts "#{index + 1}. #{n.name}"
    end 
   end
  end
  
  def display_parades_by_neighborhood
    puts "Please enter the neighborhood number to see a list of parades in that area."
    neighborhood_input = gets.strip.to_i   
    
    current_neighborhood = Neighborhood.all[neighborhood_input - 1] 
    
    if neighborhood_input <= current_neighborhood.parades.length && neighborhood_input > 0
      puts "#{current_neighborhood.name}\n"
      
      current_neighborhood.parades.each_with_index do |parade, index|
       puts "#{index + 1}. #{parade.title} - #{parade.date} - #{parade.time}"
        end 
    else 
      puts "Please enter a valid number."
      display_parades_by_neighborhood
    end 
    parade_detail_by_n(current_neighborhood)
  end 
  
  def parade_detail_by_n(current_neighborhood)
    puts "\nEnter the parade number to see more details."
    number_input = gets.strip.to_i
    
    current_parade = current_neighborhood.parades[number_input - 1] 
    
    if number_input <= (current_neighborhood.parades.length) && number_input > 0 
      puts "\n#{current_parade.title}, #{current_parade.date}, #{current_parade.time}, #{current_parade.neighborhood.name}"
       
      puts "#{current_parade.history}"
    else
      puts "Please enter a valid number."
      parade_detail_by_n
    end 
  end

end