class CreateOrderDishes < ActiveRecord::Migration[7.2]
  def change
    create_table :orders_dishes, id: false do |t|
      t.references :order, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true
    end
  end
end
