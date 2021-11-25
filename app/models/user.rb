class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :review_travelboards, dependent: :destroy
  has_many :review_experiences, dependent: :destroy
  has_many :travelboards, dependent: :destroy
  validates :username, presence: true, uniqueness: true
end
