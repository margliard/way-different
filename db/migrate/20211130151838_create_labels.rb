class CreateLabels < ActiveRecord::Migration[6.0]
  def change
    create_table :labels do |t|
      t.string :label_name
      t.text :label_description
      t.string :label_icon

      t.timestamps
    end
  end
end
