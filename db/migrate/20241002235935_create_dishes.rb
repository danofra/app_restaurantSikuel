class CreateDishes < ActiveRecord::Migration[7.2]
  def change
    create_table :dishes do |t|
      t.string :name
      t.references :ingredients, null: false, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
