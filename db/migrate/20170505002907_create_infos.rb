class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :title
      t.string :icon

      t.timestamps null: false
    end
  end
end
