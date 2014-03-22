class CreateValidUsers < ActiveRecord::Migration
  def change
    create_table :valid_users do |t|

      t.string :imei
      t.boolean :is_registered

      t.timestamps
    end
  end
end
