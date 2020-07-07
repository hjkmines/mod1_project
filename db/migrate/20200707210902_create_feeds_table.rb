class CreateFeedsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :feeds do |t|
      t.references :user
      t.references :article 
    end 
  end
end
