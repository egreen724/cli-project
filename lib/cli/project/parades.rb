class Parades
  
  attr_accessor :title, :date, :time, :neighborhood
  
  @@all = []
  
  def initialize(title, date, time, neighborhood)
    @title = title
    @date = date
    @time = time
    @neighborhood = neighborhood
    
  end
  
  def display_by_date(date)
    date = gets.strip 
    
  end
  
  def Self.display_all
    @@all 
  end
  
end