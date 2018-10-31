require 'pry'

class Neighborhood
  
  attr_accessor :name, :parades 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @parades = []
    
    @@all << self unless @@all.include?(self)
  end
  
  def add_parade(parade)
    parade.neighborhood = self.name  
    @parades << parade
  end
  
  def self.all
    @@all 
  end
  
  def self.find_by_name(name)
    self.all.find {|x| x.name == name}
  end
  
  # def self.find_or_create_by_name(name)
  #   if 
  #     self.find_by_name(name) == nil 
  #     self.create(name)
  #   else 
  #   self.find_by_name(name)
  #   end
  # end
  
end