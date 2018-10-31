class Parade
  
  attr_accessor :title, :date, :day, :time, :history, :url
  attr_reader :neighborhood
  
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
  
  def neighborhood=(neighborhood)
    @neighborhood = neighborhood 
    if Neighborhood.find_by_name(neighborhood) == true
      self.neighborhood = neighborhood
    else 
    neighborhood = Neighborhood.new(neighborhood)
    end 
    neighborhood.parades << self 
  end
  
  
end