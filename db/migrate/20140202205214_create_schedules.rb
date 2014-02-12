class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :time
      t.string :question_id
      t.string :user_id
    end
  end
end
