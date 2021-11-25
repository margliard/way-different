class AddPhotoToUsersAvatar < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :profile_photo, :string, default: ""
  end
end
