Feed.destroy_all 
User.destroy_all 
Article.destroy_all 

# #users 
# user1 = User.create(name: "Tony")
# user2 = User.create(name: "Matt")

# # #articles 
# # t.string "title"
# # t.text "summary"
# # t.string "category"
# # t.integer "time_stamp"
# article1 = Article.create(title: "Hiring surged in May as mass layoffs eased", summary: "The job market took a big step toward healing in May, though plenty of damage remains, as a record level of hiring followed record layoffs in March and April.", category: "Money", time_stamp: 7/7/2020)
# article2 = Article.create(title: "Worried for our families and all of mankind", summary: "At 260 miles above Earth, it might seem easy to forget the pandemonium of a coronavirus crisis gripping the globe.", category: "Space", time_stamp: 7/6/2020)


# #feeds
# Feed.create(user_id: user1.id, article_id: article1.id)
# Feed.create(user_id: user2.id, article_id: article2.id)

