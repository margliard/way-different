class Label < ApplicationRecord
  has_many :experience_labels
  has_many :experiences, through: :experience_labels

end
