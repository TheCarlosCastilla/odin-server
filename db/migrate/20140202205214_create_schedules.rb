class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :date
      t.string :time
      t.string :question_id
      t.string :user_id
      t.boolean :sent
    end
  end
end
