class ReviewTravelboard < ApplicationRecord
  belongs_to :user
  belongs_to :travelboard

  validates :comment, :rating, presence: true
end
