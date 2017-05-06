class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :headline
      t.text :content
      t.text :footnote
      t.references :highlight, index: true, foreign_key: true
      t.references :franchise, index: true, foreign_key: true
      t.references :restaurant, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
