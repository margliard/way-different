class ReviewExperience < ApplicationRecord
  belongs_to :user
  belongs_to :experience

  validates :comment, presence: true, length: { minimum: 6, message: "Your comment is too short" }
  validates :rating, presence: true, :inclusion => { :in => 0..5, :message => " should be between 0 to 5" }
  def blank_stars
    5 - rating.to_i
  end

end
