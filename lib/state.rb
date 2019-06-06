class State 
  
  attr_accessor :name, :abbreviation, :url, :parks_scraped
  
  @@all = [] 
  
    def initialize(name, abbreviation, url, parks_scraped = false)
      @name = name
      @abbreviation = abbreviation 
      @url = url 
      @parks_scraped = parks_scraped
      @@all << self 
    end 
    
    def self.all 
      @@all 
    end 
  
  
  
end 