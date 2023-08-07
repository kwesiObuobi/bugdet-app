class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.string :name
      t.decimal :amount
      t.references :author, foreign_key: { to_table: :users }, null: false, index: true

      t.timestamps
    end
  end
end
