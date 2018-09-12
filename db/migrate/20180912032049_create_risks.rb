class CreateRisks < ActiveRecord::Migration[5.2]
  def change
    create_table :risks do |t|
      # t.references :account, foreign_key: true
      t.float :risk

      t.timestamps
    end
  end
end
