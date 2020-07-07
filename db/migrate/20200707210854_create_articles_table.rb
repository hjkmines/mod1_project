class CreateArticlesTable < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title 
      t.text :summary
      t.string :category 
      t.string :time_stamp  
    end 
  end
end
