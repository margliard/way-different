class AddForeignKeyToReviewTravelboards < ActiveRecord::Migration[6.0]
  def change
    add_reference :review_travelboards, :travelboard, foreign_key: true
  end
end
