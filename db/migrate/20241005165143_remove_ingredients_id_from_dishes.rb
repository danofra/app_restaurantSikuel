class RemoveIngredientsIdFromDishes < ActiveRecord::Migration[7.2]
  def change
    remove_column :dishes, :ingredients_id, :integer
  end
end
