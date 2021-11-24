class RemoveColumnTravelboardidFav < ActiveRecord::Migration[6.0]
  def change
    remove_column :favorites, :travelboard_id
  end
end
