class CreateCategoriesPurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_purchases do |t|
      t.references :category, foreign_key: true, null: false
      t.references :purchase, foreign_key: true, null: false

      t.timestamps
    end
  end
end
