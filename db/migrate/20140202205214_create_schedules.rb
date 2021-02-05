class CreateSchedules < ActiveRecord::Migration[4.2]
  def change
    create_table :schedules do |t|
      t.string :time
      t.string :question_id
      t.string :user_id
      t.boolean :sent
    end
  end
end
