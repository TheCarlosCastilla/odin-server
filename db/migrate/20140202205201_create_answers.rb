class CreateAnswers < ActiveRecord::Migration[4.2]
  def change
    create_table :answers do |t|
    	t.string :time
      t.string :user_id
      t.string :question_id
      t.string :choice_id
    end
  end
end
