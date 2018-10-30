class Parade
  
  attr_accessor :title, :date, :time, :neighborhood
  
  @@all = []
  
  def initialize
    @title = title
    @date = date
    @time = time
    @neighborhood = neighborhood
    @@all << self 
  end
  
  def Self.all
    @@all 
  end
  
end