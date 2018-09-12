class CreateAccountRisks < ActiveRecord::Migration[5.2]
  def change
    create_table :account_risks do |t|
      t.references :account, foreign_key: true
      t.references :risk, foreign_key: true

      t.timestamps
    end
  end
end
