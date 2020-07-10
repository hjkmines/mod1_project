class Cli

  def welcome  
      font = TTY::Font.new(:doom)
      puts font.write("What's  Happening?")
      puts "Hello! What is your name?".colorize(:yellow)
      $user_name = gets.strip  
      $user = User.create(name: $user_name)
      Cli.choose_category
  end 
  
  def self.choose_category 
    puts ""
    puts "Welcome #{$user_name}, what would you like to read about? Enter the number next to your chosen category.".colorize(:yellow)
    categories = ["", "CATEGORIES:".colorize(:green), " ", "1. Business", "2. Entertainment", "3. General", "4. Health", "5. Science", "6. Sports", "7. Technology", "8. Pick a Random Headline for Me", "", "OPTIONS:".colorize(:green), "", "9. View My Saved Articles", "10. Delete an article from my profile"]
    puts categories
    user_choice = gets.strip.to_i
    if user_choice == 1 
      user_choice = "business"
      Article.categories(user_choice)
      puts ""
      Cli.home_or_exit
    elsif user_choice == 2 
      user_choice = "entertainment"
      Article.categories(user_choice)
      puts ""
      Cli.home_or_exit
    elsif user_choice == 3
      user_choice = "general"
      Article.categories(user_choice)
      puts ""
      Cli.home_or_exit
    elsif user_choice == 4
      user_choice = "health"
      Article.categories(user_choice)
      puts ""
      Cli.home_or_exit
    elsif user_choice == 5
      user_choice = "science"
      Article.categories(user_choice)
      puts ""
      Cli.home_or_exit
    elsif user_choice == 6
      user_choice = "sports"
      Article.categories(user_choice)
      puts ""
      Cli.home_or_exit
    elsif user_choice == 7
      user_choice = "technology"
      Article.categories(user_choice)
      puts ""
      Cli.home_or_exit
    elsif user_choice == 8 
      puts ""
      Article.random
      puts ""
      Cli.home_or_exit
    elsif user_choice == 9 
      puts ""
      puts "#{$user_name}, here are your saved articles:".colorize(:yellow)
      puts ""
      counter = 1
      $user.reload
      $user.articles.each do |article|
        puts ""
        puts "#{counter}. #{article.title}" 
        counter += 1
      end
      puts ""
      Cli.home_or_exit
    elsif user_choice == 10
      puts ""
      puts "Enter the number for the article to be removed".colorize(:yellow)
      puts ""
      counter = 1
      $user.reload
      $user.articles.each do |article|
        puts ""
        puts "#{counter}. #{article.title}" 
        counter += 1
      end 
      response = (gets.strip.to_i - 1) 
      $user.articles.each do |article|
        if $user.articles.index(article) == response  
          Feed.find_by(article_id: article.id).destroy
          article.destroy  
          $user.reload 
          puts ""
          puts "Your article has been removed from your profile!".colorize(:yellow)
          puts ""
          Cli.home_or_exit
        end 
      end 
      Cli.home_or_exit
    else 
      puts "Sorry, I didn't understand that. Please try again.".colorize(:yellow)
      Cli.choose_category
    end 

  end

  def self.home_or_exit 
    puts "Do you wish to go back to the home page or exit the program? Enter (Home or Exit)".colorize(:yellow)
    user_response = gets.strip 
    if user_response == "H" || user_response == "h" || user_response == "Home" || user_response == "home"
      Cli.choose_category
    elsif 
      user_response == "exit" || user_response == "Exit"
      exit 
    else
      puts "Sorry, I didn't understand that. Please try again.".colorize(:yellow)
      Cli.home_or_exit
    end 
  end 

end 