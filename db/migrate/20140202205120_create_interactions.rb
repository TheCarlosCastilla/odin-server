class CreateInteractions < ActiveRecord::Migration[4.2]
  def change
    create_table :interactions do |t|
      t.string :user_id
      t.string :peer_id
      t.string :time
      t.string :duration
      t.string :rssi
    end
  end
end
