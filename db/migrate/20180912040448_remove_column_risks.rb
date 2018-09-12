class RemoveColumnRisks < ActiveRecord::Migration[5.2]
  def change
  	change_table :risks do |t|
 		t.remove_index :account_id
	end
  end
end
