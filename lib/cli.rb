class Cli

  def welcome 
    puts "Hello! What is your name?"
    $user_name = gets.strip  
    $user = User.create(name: $user_name)
    choose_category
  end 
  
  def choose_category 
    puts ""
    puts "Welcome #{$user_name}, what would you like to read about? Enter the number next to your chosen category."
    categories = ["1. Business", "2. Entertainment", "3. General", "4. Health", "5. Science", "6. Sports", "7. Technology", "8. Pick a Random Headline for Me", "9. View My Saved Articles"]
    puts categories
    user_choice = gets.strip.to_i
    if user_choice == 1 
      user_choice = "business"
      Article.categories(user_choice)
      puts ""
      home_or_exit
    elsif user_choice == 2 
      user_choice = "entertainment"
      Article.categories(user_choice)
      puts ""
      home_or_exit
    elsif user_choice == 3
      user_choice = "general"
      Article.categories(user_choice)
      puts ""
      home_or_exit
    elsif user_choice == 4
      user_choice = "health"
      Article.categories(user_choice)
      puts ""
      home_or_exit
    elsif user_choice == 5
      user_choice = "science"
      Article.categories(user_choice)
      puts ""
      home_or_exit
    elsif user_choice == 6
      user_choice = "sports"
      Article.categories(user_choice)
      puts ""
      home_or_exit
    elsif user_choice == 7
      user_choice = "technology"
      Article.categories(user_choice)
      puts ""
      home_or_exit
    elsif user_choice == 8 
      Article.random
      puts ""
      home_or_exit
    elsif user_choice == 9 
      p $user.articles 
    else 
      puts "Sorry, I didn't understand that. Please try again."
      choose_category
    end 

  end

  def home_or_exit 
    puts "Do you wish to go back to the home page or exit the program? Enter (Yes or Exit)"
    user_response = gets.strip 
    if user_response == "Y" || user_response == "y" || user_response == "Yes" || user_response == "yes"
      choose_category
    elsif 
      user_response == "exit" || user_response == "Exit"
      exit 
    else
      puts "Sorry, I didn't understand that. Please try again."
      home_or_exit
    end 
  end 


end 