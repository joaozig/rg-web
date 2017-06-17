class AddSummaryToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :summary, :text
  end
end
