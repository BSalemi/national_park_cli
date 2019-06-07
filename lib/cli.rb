class CLI 
  
  @@selected_state = nil 
  
  def self.selected_state 
    @@selected_state
  end
  
  def run 
    Scraper.scrape_nps
    welcome
    sleep 1
    show_states
    ask_to_select_state
    user_input = gets.strip
    @@selected_state = State.find_by_abbrev(user_input)
    @@selected_state.scraped? ? putyouralternativemethodhere : Scraper.scrape_individual_page(@@selected_state.url)
    show_parks
  end
  
  def welcome 
    puts "Welcome to National Park CLI!"
  end
  
  def show_states 
    State.all.each do |state|
     puts "#{state.abbreviation.upcase} - #{state.name}"
   end 
 end 
 
 def ask_to_select_state
   puts "Please enter the abbreviation for a list of National Parks in that state."
 end 
 
 def show_parks
   Park.all.each do |park|
     binding.pry
     puts "#{park.name} - #{park.type}"
  end 
 end 
 
  
end