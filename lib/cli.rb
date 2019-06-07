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
    @@selected_state.scraped? ? show_parks : Scraper.scrape_individual_page(@@selected_state.url)
    show_parks
    ask_to_select_bio
    bio_input = gets.strip.to_i
    Park.find_bio_by_index(bio_input)
    # binding.pry
    
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
   Park.all.each.with_index(1) do |park, index|
    # binding.pry
     puts "#{index}.#{park.name} - #{park.type}"
  end 
 end 
 
 def ask_to_select_bio
   puts "Please enter the number of the National Park you would like to learn more about or type 'exit'"
 end 
 
 
  
end