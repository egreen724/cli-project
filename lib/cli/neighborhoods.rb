class Project::Neighborhood
  
  attr_accessor = :name, :parades 
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @parades = []
  end
  
  def self.all
    @@all 
  end
  
  def self.find_by_name(name)
    self.all.find {|x| x.name == name}
  end
  
end