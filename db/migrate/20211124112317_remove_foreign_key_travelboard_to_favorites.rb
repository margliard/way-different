class RemoveForeignKeyTravelboardToFavorites < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :favorites, :travelboards
  end
end
