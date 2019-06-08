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
      # if @@all.include?(string.upcase)
         @@all.detect do |state|
          state.abbreviation.upcase == string.upcase
        end 
      # else 
      #   puts "Please enter the abbreviation for a list of National Parks in that state."
      # end 
    end 
    
    def parks 
      Park.all.select {|park| park.state == self}
    end 
  
  
  
end 