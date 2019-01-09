class AddAnotherColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :current_company, :string
  end
end
