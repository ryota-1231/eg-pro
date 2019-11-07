class RemoveImageToDrill < ActiveRecord::Migration[6.0]
  def change
    remove_column :drills, :image_3, :text
  end
end
