class Travelboard < ApplicationRecord
  has_many :review_travelboards, dependent: :destroy
  has_many :traveldays, dependent: :destroy
  has_many :experiences, through: :traveldays
  has_many :chatrooms, dependent: :destroy
  has_one_attached :photo
  # has_many :favorites, through: :traveldays
  # has_many :experiences, through: :favorites
  belongs_to :user
  validates :name, :start_date, :end_date, :country, :photo, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_city_and_country,
    against: [ :country ],
    using: {
      tsearch: { prefix: true }
    }

  def travelday_zero
    self.traveldays.select do |travelday|
      travelday.day_number == 0
    end
  end
end
