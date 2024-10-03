class CreateOrderTable < ActiveRecord::Migration[7.2]
  def change
    create_table :order_tables do |t|
      t.integer :order_id
      t.integer :table_id
    end
  end
end
