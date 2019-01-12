class EditMessages < ActiveRecord::Migration[5.2]
  def change
   create_table :messages do |t|
    t.text :content
    t.references :conversation, index: true
    t.references :user, index: true
    end
  end
end
