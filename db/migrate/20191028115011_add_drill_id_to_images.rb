class AddDrillIdToImages < ActiveRecord::Migration[6.0]
  def change
    add_reference :images, :drill, foreign_key: true
  end
end
