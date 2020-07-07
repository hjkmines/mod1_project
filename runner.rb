require_relative 'config/environment'

app = Cli.new 

app.welcome 

app.choose_category

Article.output

binding.pry 