class CLI 
  
  def initialize
    
  end
  
  def call 
    puts "Welcome to Mardi Gras 2019! Please use the choices below for more information about the parade schedule and events."
    puts "Would you like to: see the full parade schedule (enter “full schedule”), see the parades by date (enter “by date”), or see the parades by neighborhood (enter “by neighborhood”)? Type “Menu” to see these options again."
    
    input = gets.strip.to_s 
    
    if input == "full schedule"
      #method for list of parades (Parades.display_all)
      elsif input == "by date"
      "Please enter the date that you would like to attend a parade (MM/DD/YYYY):"
        date_input = gets.strip 
        #method to search and find by date
      elsif input == "by neighborhood"
        neighborhood_input = gets.strip 
        #method to find and display by neighborhood 
      elsif input == "Menu"
       "Would you like to: see the full parade schedule (enter “full schedule”), see the parades by date (enter “by date”), or see the parades by neighborhood (enter “by neighborhood”)? Type “Menu” to see these options again."
     else 
       "Please enter a valid option."
     end
  end
  
end