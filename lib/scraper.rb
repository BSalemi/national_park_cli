require 'pry'
require 'open-uri'
require 'nokogiri'

class Scraper 
  
  NPS_INDEX = "https://www.nps.gov/index.htm"
  
  def self.scrape_nps
    doc = open(NPS_INDEX)
    parsed_doc = Nokogiri::HTML(doc)
    grabbed_elements = parsed_doc.css("ul.dropdown-menu li")
    grabbed_elements.each do |element|
      name = element.text 
      url = element.css("a").attribute("href").value
      abbreviation = url.slice(7..8)
      State.new(name, url, abbreviation)
    end 
  end   
  
end 