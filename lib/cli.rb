class CLI 
  
  def run 
    Scraper.scrape_nps
    welcome
    sleep 2
    show_states
    select_state
  end
  
  def welcome 
    puts "Welcome to National Park CLI!"
  end
  
  def show_states 
    State.all.each do |state|
     puts "#{state.abbreviation.upcase} - #{state.name}"
   end 
 end 
 
 def select_state
   puts "Please enter the abbreviation for a list of National Parks in that state."
 end 
  
end