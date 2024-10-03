class CreateTableOrdersDishes < ActiveRecord::Migration[7.2]
  def change
    create_join_table :orders, :dishes do |t|
      t.index :order_id
      t.index :dish_id
    end
  end
end
