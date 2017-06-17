class AddSummaryToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :summary, :text
  end
end
