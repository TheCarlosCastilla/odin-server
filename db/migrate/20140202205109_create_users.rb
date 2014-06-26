class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :hashed_number
      t.integer :valid_user_id
      t.boolean :is_claimed

      t.timestamps
      
    end
  end
end
