class CreateOrderDish < ActiveRecord::Migration[7.2]
  def change
    create_table :order_dishes do |t|
      t.integer :order_id
      t.integer :dish_id
    end
  end
end
