class CreateDishIngredient < ActiveRecord::Migration[7.2]
  def change
    create_table :dish_ingredients do |t|
      t.integer :dish_id
      t.integer :ingredient_id
    end
  end
end
