class CreateCurriculums < ActiveRecord::Migration[6.0]
  def change
    create_table :curriculums do |t|
      t.text :curriculums

      t.timestamps
    end
  end
end
