class RemoveColumnAssignedDayToFavorites < ActiveRecord::Migration[6.0]
  def change
    remove_column :favorites, :assigned_day
    remove_foreign_key :favorites, :experiences
  end
end
