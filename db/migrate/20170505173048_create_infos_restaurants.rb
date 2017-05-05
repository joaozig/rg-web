class CreateInfosRestaurants < ActiveRecord::Migration
  def change
    create_table :infos_restaurants do |t|
      t.references :info, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true
    end
  end
end
