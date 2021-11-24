class Travelday < ApplicationRecord
  has_many :favorites
  belongs_to :travelboard
end
