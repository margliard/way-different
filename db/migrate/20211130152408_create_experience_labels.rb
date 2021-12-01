class CreateExperienceLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :experience_labels do |t|
      t.references :experience, null: false, foreign_key: true
      t.references :label, null: false, foreign_key: true
      t.timestamps
    end
  end
end
