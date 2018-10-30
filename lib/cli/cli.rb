class CLI 
  
  def initialize  
     puts "Welcome to Mardi Gras 2019! Please use the choices below for more information about the parade schedule and events."
  end
  
  def call
    menu
  end
  
  def menu  
    puts "Would you like to: see the full parade schedule (enter “full schedule”), see the parades by date (enter “by date”), or see the parades by neighborhood (enter “by neighborhood”)?"
    
    input = gets.strip.to_s 
    
    case input 
    when "full schedule"
      list_parades
    when "by date"
        #list dates; method to search and find by date
    when "by neighborhood"
        neighborhood_input = gets.strip 
        #list neighborhoods; method to find and display by neighborhood 
    when "exit"
      exit_method
    else
       puts "Please enter a valid option." 
       menu 
     end
  end
  
  def exit_method 
    puts "Thank you for exploring the Mardi Gras parade schedule for 2019!"
  end 
  
  def list_parades 
    parade_list = Parade.all.sort{|a, b| a.date <=> b.date} 
    
    parade_list.each_with_index do |parade, index|
      puts "#{index + 1}. #{parade.title} - #{parade.neighborhood} - #{parade.date} - #{parade.time}"
    end
  end
  
   def find_and_display_by_date(date)
    puts "Please enter the date that you would like to attend a parade (MM/DD/YYYY):"
    date_input = gets.strip  
    
    if neighborhood = Neighborhood.find_by_name(input)
      neighborhood.parades.sort{|a, b| a.date <=> b.date}.each_with_index |parade, index|
      puts "#{index + 1}. #{parade.title} - #{parade.date} - #{parade.time}"
    end 
  end
end
  
end