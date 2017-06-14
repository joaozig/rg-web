class AddPlaceToRestaurants < ActiveRecord::Migration
  def change
    add_reference :restaurants, :place, index: true, foreign_key: true
  end
end
