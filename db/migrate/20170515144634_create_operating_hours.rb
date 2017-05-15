class CreateOperatingHours < ActiveRecord::Migration
  def change
    create_table :operating_hours do |t|
      t.integer :day
      t.time :opening_time
      t.time :closing_time
      t.references :restaurant, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
