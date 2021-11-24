class Experience < ApplicationRecord
  has_many :review_experiences
  has_many :favorites

  include PgSearch::Model
  pg_search_scope :search_by_city,
    against: [:city],
    using: {
      tsearch: { prefix: true }
    }
end
