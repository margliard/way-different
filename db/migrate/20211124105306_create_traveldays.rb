class CreateTraveldays < ActiveRecord::Migration[6.0]
  def change
    create_table :traveldays do |t|
      t.integer :day_number

      t.timestamps
    end
  end
end
