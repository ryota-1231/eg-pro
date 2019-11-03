class AddAncestryToCurriliculum < ActiveRecord::Migration[6.0]
  def change
    add_column :curriculums, :ancestry, :string
  end
end
