class Favorite < ApplicationRecord
  belongs_to :experience
  belongs_to :travelboard

  validates :experience_id, uniqueness: { scope: :travelboard_id, message: "is already in the list" }
end
