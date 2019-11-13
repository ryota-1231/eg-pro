class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :uid, :string
    add_column :users, :provider, :string
    add_column :users, :nickname, :string
    add_column :users, :location, :string
    add_column :users, :image, :string
  end
end
