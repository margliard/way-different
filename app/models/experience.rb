class Experience < ApplicationRecord
  has_many :review_experiences, dependent: :destroy
  has_many :favorites, dependent: :destroy

  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [:city],
    using: {
      tsearch: { prefix: true }
    }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
