class Park
  attr_accessor :type, :name, :location, :bio 
  
  @@all = []
  
    def initialize(type, name, location, bio)
      @type = type 
      @name = name 
      @location = location
      @bio = bio 
      @@all << self 
    end 
    
    def self.all 
      @@all 
    end 
  
  
  
end 