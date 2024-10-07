class AddUserIdToIngredients < ActiveRecord::Migration[7.2]
  def change
    add_column :ingredients, :user_id, :integer
  end
end
