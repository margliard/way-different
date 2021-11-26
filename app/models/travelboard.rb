class Travelboard < ApplicationRecord
  has_many :review_travelboards, dependent: :destroy
  has_many :traveldays, dependent: :destroy
  # has_many :favorites, through: :traveldays
  # has_many :experiences, through: :favorites
  belongs_to :user

  include PgSearch::Model
  pg_search_scope :search_by_city_and_country,
    against: [ :country ],
    using: {
      tsearch: { prefix: true }
    }
end
