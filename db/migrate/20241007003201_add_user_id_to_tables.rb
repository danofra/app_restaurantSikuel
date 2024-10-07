class AddUserIdToTables < ActiveRecord::Migration[7.2]
  def change
    add_column :tables, :user_id, :integer
  end
end
