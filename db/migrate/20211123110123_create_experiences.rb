class CreateExperiences < ActiveRecord::Migration[6.0]
  def change
    create_table :experiences do |t|
      t.string :category
      t.string :name
      t.string :address
      t.boolean :availability
      t.integer :price
      t.string :city
      t.string :country
      t.float :latitude
      t.float :longitude
      t.string :description
      t.boolean :booked

      t.timestamps
    end
  end
end
