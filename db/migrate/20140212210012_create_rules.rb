class CreateRules < ActiveRecord::Migration
  def change
    create_table :rules do |t|
      t.string :user_id
      t.string :peer_id
      t.string :delay
      t.string :question_id      
    end
  end
end
