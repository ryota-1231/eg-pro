class AddImageToDrill < ActiveRecord::Migration[6.0]
  def change
    add_column :drills, :image_1, :text
    add_column :drills, :image_2, :text 
    add_column :drills, :image_3, :text
  end
end
