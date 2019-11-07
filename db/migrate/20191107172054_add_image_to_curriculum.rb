class AddImageToCurriculum < ActiveRecord::Migration[6.0]
  def change
    add_column :curriculums, :image, :text
  end
end
