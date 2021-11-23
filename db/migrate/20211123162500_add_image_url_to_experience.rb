class AddImageUrlToExperience < ActiveRecord::Migration[6.0]
  def change
    add_column :experiences, :image_url, :string
  end
end
