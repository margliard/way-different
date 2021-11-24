class Travelday < ApplicationRecord
  has_many :favorites
  belongs_to :travelboard
  has_many :experiences, through: :favorites
end
