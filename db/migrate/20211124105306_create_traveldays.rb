class CreateTraveldays < ActiveRecord::Migration[6.0]
  def change
    create_table :traveldays do |t|
      t.integer :day_number
      t.references :favorite, null: false, foreign_key: true
      t.references :travelboard, null: false, foreign_key: true
      t.timestamps
    end
  end
end
