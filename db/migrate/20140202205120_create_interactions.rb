class CreateInteractions < ActiveRecord::Migration
  def change
    create_table :interactions do |t|
      t.string :user_id
      t.string :friend_id
      t.string :time
      t.string :duration
    end
  end
end
