class AddStatusToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :status, :integer
  end
end
