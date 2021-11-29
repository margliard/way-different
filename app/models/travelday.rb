class Travelday < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :experiences, through: :favorites
  belongs_to :travelboard
end
