class CreateFavorites < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.date :assigned_day
      t.references :experience, null: false, foreign_key: true
      t.references :travelboard, null: false, foreign_key: true

      t.timestamps
    end
  end
end
