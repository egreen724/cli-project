class Parade
  
  attr_accessor :title, :date, :time, :neighborhood, :history, :url
  
  @@all = []
  
  def initialize
    @title = title
    @date = date
    @time = time
    @neighborhood = neighborhood
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
  
end