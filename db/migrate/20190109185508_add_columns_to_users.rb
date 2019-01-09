class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_position, :string
    add_column :users, :current_industry, :string
  end
end
