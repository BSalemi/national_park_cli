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
    # binding.pry
    @@selected_state.scraped? ? show_parks : Scraper.scrape_individual_page(@@selected_state.url)
    show_parks
    puts
    ask_to_select_bio
    bio_input = gets.strip.to_i
    Park.find_bio_by_index(bio_input)
    puts
    continue_or_exit
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
   Park.all.each_with_index do |park, index|
    # binding.pry
     puts "#{index + 1}.#{park.name} - #{park.type}"
  end 
 end 
 
 def ask_to_select_bio
   puts "Please enter the number of the National Park you would like to learn more about or type 'exit'"
   
 end 
 
 def continue_or_exit
   puts "Please enter 'more' if you'd like to see another park bio or 'exit' to exit."
    user_input = ""
    user_input = gets.strip
   
   while user_input != 'exit' 
      show_parks
      ask_to_select_bio
      bio_input = gets.strip.to_i
      Park.find_bio_by_index(bio_input)
      puts
      puts "Please enter 'more' if you'd like to see another park bio or 'exit' to exit."
      user_input = gets.strip
    end 
      puts
      goodbye
  # elsif 
  #   user_input != "exit" && user_input != "more" 
  #     puts "Please enter 'more' if you'd like to see another park bio or 'exit' to exit."
end 
     
 def goodbye
   puts "Thanks for using the National Park CLI!"
 end 
end