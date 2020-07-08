class Cli

  def welcome 
    puts "Hello! What is your name?"
    $user_name = gets.strip  
    choose_category
  end 

  
  def choose_category 
    puts "Welcome #{$user_name}, what would you like to read about?"
    categories = ["1. Business", "2. Entertainment", "3. General", "4. Health", "5. Science", "6. Sports", "7. Technology", "8. Pick a Random Headline for Me", "9. View My Saved Articles"]
    puts categories
    user_choice = gets.strip.to_i
    if user_choice == 1 
      user_choice = "business"
      p Article.categories(user_choice)
      home_or_exit
    elsif user_choice == 2 
      user_choice = "entertainment"
    elsif user_choice == 3
      user_choice = "general"
    elsif user_choice == 4
      user_choice = "health"
    elsif user_choice == 5
      user_choice = "science"
    elsif user_choice == 6
      user_choice = "sports"
    elsif user_choice == 7
      user_choice = "technology"
    end 
    #  if choice is random, use enumerator to pick a random headline
    # if choice is saved articles, run saved_articles method
  end

  def random_article 
    puts "Here's a random headline for you! Click on it to see more information or to save it to your favorites."
    # select and display a random article from top headlines
      # clicking on it shows summary, link, and allows user to add to favorites
    puts "Would you like to see another random headline, or would you like to go home?"
      # display another random article or call home_page method
  end

  def display_catagory 
    puts "Here are today's top #{chosen_category} headlines."
    # display top 5 articles from the category selected by user
    # user has ability to click on an article to 'see more'
      # 'see more' shows summary, link, and allows user to add to favorites
    # ask user: would you like to see more headlines or go back?
      # display more headlines OR go back to 'home'
  end

  def display_saved_articles
    # display all saved articles
    # allow user to click on them for more info (including d)lete
    # 
  end

  def home_or_exit 
    puts "Do you wish to go back to the home page or exit the program? Enter (Yes or Exit)"
    user_response = gets.strip 
    if user_response == "Y" || user_response == "y" || user_response == "Yes" || user_response == "yes"
      choose_category
    else 
      exit 
    end 
  end 


end 