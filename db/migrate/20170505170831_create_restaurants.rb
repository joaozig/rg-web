class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :slogan
      t.string :address
      t.string :phone
      t.string :latitude
      t.string :longitude
      t.references :franchise, index: true, foreign_key: true
      t.references :neighborhood, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
