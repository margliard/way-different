class AddForeignKeyExperiencesToFavorites < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :favorites, :experiences
  end
end
