class CLI 
  
  def run 
    Scraper.scrape_nps #scrapes all the states before the welcome is puts'd in the console
    welcome
  end
  
  def welcome 
    puts "Welcome to National Park CLI!"
  end
  
end