class Experience < ApplicationRecord
  has_many :review_experiences
  has_many :favorites

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
