class Experience < ApplicationRecord
  has_many :review_experiences
  has_many :favorites
end
