class Park
  attr_accessor :type, :name, :location, :bio, :state
  
  @@all = []
  
    def initialize(type, name, location, bio, state)
      @type = type 
      @name = name 
      @location = location
      @bio = bio 
      @state = state
      @@all << self 
    end 
    
    def self.all 
      @@all 
    end 
  
  
  
end 