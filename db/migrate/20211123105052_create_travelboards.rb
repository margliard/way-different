class CreateTravelboards < ActiveRecord::Migration[6.0]
  def change
    create_table :travelboards do |t|
      t.string :name
      t.boolean :status
      t.date :start_date
      t.date :end_date
      t.string :country

      t.timestamps
    end
  end
end
