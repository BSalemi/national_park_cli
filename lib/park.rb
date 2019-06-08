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
      if number >= 1 && number <= Park.all.length
      number -= 1
      park_bio = Park.all[number].bio
      puts park_bio
    else 
      "Please enter a valid National Park number."
    end 
    end 
end 