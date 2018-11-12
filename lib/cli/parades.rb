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
  
  def self.sorted 
    self.all.sort{|a, b| a.date <=> b.date}
  end 
  
   def self.find_by_title(title)
    self.all.find {|x| x.title == title}
  end
  
end