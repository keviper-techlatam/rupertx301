class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.references :account, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
