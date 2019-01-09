class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :username
    remove_column :users, :bio
    add_column :users, :email, :string
    add_column :users, :full_name, :string
  end
end
