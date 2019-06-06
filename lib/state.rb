class State 
  
  attr_accessor :name, :url, :abbreviation, :parks_scraped
  
  @@all = [] 
  
    def initialize(name, url, abbreviation, parks_scraped = false)
      @name = name
      @url = url
      @abbreviation = abbreviation 
      @parks_scraped = parks_scraped
      @@all << self 
    end 
    
    def self.all 
      @@all 
    end 
  
  
  
end 