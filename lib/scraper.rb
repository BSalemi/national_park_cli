require 'pry'

class Scraper 
  
  NPS_INDEX = "https://www.nps.gov/index.htm"
  
  def self.scrape_nps
    doc = open(NPS_INDEX)
    parsed_doc = Nokogiri::HTML(doc)
    binding.pry
  
  end   
  
end 