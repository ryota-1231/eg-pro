class AddNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :text, null: false
  end
end
