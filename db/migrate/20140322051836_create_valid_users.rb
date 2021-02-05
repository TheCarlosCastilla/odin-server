class CreateValidUsers < ActiveRecord::Migration[4.2]
  def change
    create_table :valid_users do |t|

      t.string :imei
      t.boolean :is_registered

      t.timestamps
    end
  end
end
