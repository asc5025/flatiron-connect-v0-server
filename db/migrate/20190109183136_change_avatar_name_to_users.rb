class ChangeAvatarNameToUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :avatar
    add_column :users, :img_url, :string
  end
end
