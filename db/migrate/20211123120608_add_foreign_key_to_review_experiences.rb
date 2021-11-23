class AddForeignKeyToReviewExperiences < ActiveRecord::Migration[6.0]
  def change
    add_reference :review_experiences, :experience, foreign_key: true
  end
end
