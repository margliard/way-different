class AddForeignKeyToTraveldays < ActiveRecord::Migration[6.0]
  def change
    add_reference :traveldays, :travelboard, foreign_key: true
  end
end
