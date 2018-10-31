class Parade
  
  attr_accessor :title, :date, :time, :neighborhood, :history 
  
  @@all = []
  
  def initialize
    @title = title
    @date = date
    @time = time
    @neighborhood = neighborhood
    @history = history 
    @@all << self 
  end
  
  def self.all
    @@all 
  end
  
   def self.find_by_name(name)
    self.all.find {|x| x.name == name}
  end
  
end