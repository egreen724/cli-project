
class CLI 
  
  def initialize
     puts "Welcome to Mardi Gras 2019! Please use the choices below for more information about the parade schedule and events."
  end
  
  def call 
   
    puts "Would you like to: see the full parade schedule (enter “full schedule”), see the parades by date (enter “by date”), or see the parades by neighborhood (enter “by neighborhood”)?"
    
    input = gets.strip.to_s 
    
    if input == "full schedule"
      #method for list of parades (Parades.display_all)
      elsif input == "by date"
        #method to search and find by date
      elsif input == "by neighborhood"
        neighborhood_input = gets.strip 
        #method to find and display by neighborhood 
      else
       puts "Please enter a valid option." 
       call 
     end
  end
  
end