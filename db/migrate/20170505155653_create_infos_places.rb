class CreateInfosPlaces < ActiveRecord::Migration
  def change
    create_table :infos_places do |t|
      t.references :info, index: true, foreign_key: true
      t.references :place, index: true, foreign_key: true
    end
  end
end
