class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.references :table, null: false, foreign_key: true
      t.references :dish, null: false, foreign_key: true
      t.text :note

      t.timestamps
    end
  end
end
