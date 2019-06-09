class State 
  
  attr_accessor :name, :url, :abbreviation
  
  @@all = [] 
  
    def initialize(name, url, abbreviation)
      @name = name
      @url = url
      @abbreviation = abbreviation 
      @@all << self 
    end 
    
    def self.all 
      @@all 
    end 
    
    def scraped? 
      self.parks.length > 0
    end
   
    
    def self.find_by_abbrev(string)
         @@all.detect do |state|
          state.abbreviation.upcase == string.upcase
        end 
    end 
    
    def parks 
      Park.all.select {|park| park.state == self}
    end 
  
  
  
end 