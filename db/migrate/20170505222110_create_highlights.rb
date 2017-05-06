class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :title
      t.string :headline
      t.text :content
      t.text :footnote
      t.integer :type
      t.references :franchise, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
