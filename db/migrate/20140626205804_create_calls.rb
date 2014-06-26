class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
    	t.string :user_id
    	t.string :peer_id
    	t.string :time
    	t.string :duration
    	t.string :call_type
    end
  end
end
