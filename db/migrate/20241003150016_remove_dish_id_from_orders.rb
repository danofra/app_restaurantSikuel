class RemoveDishIdFromOrders < ActiveRecord::Migration[7.2]
  def change
    remove_column :orders, :dish_id, :integer
  end
end
