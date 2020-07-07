class Cli 

  def welcome 
    puts "Hello! What is your name?"
    $user_name = gets.strip  
  end 

  def choose_category 
    puts "Welcome #{$user_name}, what would you like to read about?"
    categories = ["1. Space", "2. Sports", "3. Economy"]
    puts categories
  end 

end 