class Travelboard < ApplicationRecord
  has_many :review_travelboards
  has_many :traveldays
  has_one :user, through: :user
end
