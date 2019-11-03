class CreateDrills < ActiveRecord::Migration[6.0]
  def change
    create_table :drills do |t|
      t.text :title, null: false
      t.text :discription, null: false
      t.references :curriculum, foreign_key: true
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
