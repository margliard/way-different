class CreateReviewTravelboards < ActiveRecord::Migration[6.0]
  def change
    create_table :review_travelboards do |t|
      t.text :comment
      t.float :rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
