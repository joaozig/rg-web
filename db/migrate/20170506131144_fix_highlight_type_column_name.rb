class FixHighlightTypeColumnName < ActiveRecord::Migration
  def change
  	rename_column :highlights, :type, :highlight_type
  end
end
