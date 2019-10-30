class AddAncestryToDrill < ActiveRecord::Migration[6.0]
  def change
    add_column :drills, :ancestry, :string
  end
end
