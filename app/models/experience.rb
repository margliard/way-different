class Experience < ApplicationRecord
  has_many :review_experiences
  has_many :favorites

  include PgSearch::Model
  pg_search_scope :search_by_city_and_country,
    against: [ :city, :country ],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
