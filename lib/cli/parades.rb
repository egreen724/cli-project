class Parade
  
  attr_accessor :title, :date, :day, :time, :history, :url, :neighborhood
  #attr_reader :neighborhood
  
  @@all = []
  
  def initialize
    @title = title
    @date = date
    @day = day 
    @time = time
    @history = history 
    @url = url 
    @@all << self 
  end
  
  def self.all
    @@all 
  end
  
   def self.find_by_title(title)
    self.all.find {|x| x.title == title}
  end
  
  # def neighborhood=(neighborhood)
  #   @neighborhood = neighborhood 
    
  #   if Neighborhood.all.include?(neighborhood)
  #   neighborhood.add_parade(self)
  #   else 
  #     new_neighborhood = Neighborhood.new(neighborhood)
  #     new_neighborhood.parades << self 
  #   end 
  # end
  
end