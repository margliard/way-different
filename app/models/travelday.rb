class Travelday < ApplicationRecord
  has_many :favorites
  has_many :experiences, through: :favorites
  belongs_to :travelboard
end
