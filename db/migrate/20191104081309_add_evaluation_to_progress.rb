class AddEvaluationToProgress < ActiveRecord::Migration[6.0]
  def change
    add_column :progresses, :evaluation, :integer
  end
end
