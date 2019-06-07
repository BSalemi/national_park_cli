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
      state_url = element.css("a").attribute("href").value
      url = NPS_INDEX.gsub("/index.htm", state_url)
      abbreviation = state_url.slice(7..8)
      State.new(name, url, abbreviation)
    end 
  end   
  
  def self.scrape_individual_page(url)
    doc = open(url)
    parsed_doc = Nokogiri::HTML(doc)
    grabbed_elements = parsed_doc.css("li.clearfix")
    grabbed_elements.each do |element|
      type = grabbed_elements.css("h2").text
      name = grabbed_elements.css("h3").text
      location = grabbed_elements.css("h4").text
      bio = grabbed_elements.css("p").text
      Park.new(type, name, location, bio)
    end 
  end 
end 