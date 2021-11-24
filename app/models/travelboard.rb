class Travelboard < ApplicationRecord
  has_many :review_travelboards
  has_many :traveldays
  # has_many :favorites, through: :traveldays
  # has_many :experiences, through: :favorites
  has_one :user, through: :user
end
