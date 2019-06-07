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
    
    def self.find_bio_by_index(number)
    number =- 1 
    bio = @@all[number].bio
    bio
    end 
end 