class Favorite < ApplicationRecord
  belongs_to :experience

  validates :experience_id, uniqueness: { scope: :travelboard_id, message: "is already in the list" }
end
