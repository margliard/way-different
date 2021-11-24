class AddForeignKeyToTraveldays < ActiveRecord::Migration[6.0]
  def change
    add_reference :traveldays, :travelboards, foreign_key: true
  end
end
