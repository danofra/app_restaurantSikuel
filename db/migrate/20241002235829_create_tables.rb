class CreateTables < ActiveRecord::Migration[7.2]
  def change
    create_table :tables do |t|
      t.integer :number
      t.boolean :available

      t.timestamps
    end
  end
end
