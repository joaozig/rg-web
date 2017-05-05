class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :latitude
      t.string :longitude
      t.references :neighborhood, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
