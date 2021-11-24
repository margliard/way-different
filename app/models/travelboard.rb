class Travelboard < ApplicationRecord
  has_many :review_travelboards
  has_many :traveldays
  belongs_to :user
end
