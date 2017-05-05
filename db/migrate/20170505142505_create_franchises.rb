class CreateFranchises < ActiveRecord::Migration
  def change
    create_table :franchises do |t|
      t.string :name
      t.text :summary

      t.timestamps null: false
    end
  end
end
