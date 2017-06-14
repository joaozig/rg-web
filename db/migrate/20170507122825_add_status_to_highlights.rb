class AddStatusToHighlights < ActiveRecord::Migration
  def change
    add_column :highlights, :status, :integer, :default => 0
  end
end
