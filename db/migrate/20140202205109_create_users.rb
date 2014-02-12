class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user_id
      t.string :imei
      t.boolean :is_claimed
      
    end
  end
end
