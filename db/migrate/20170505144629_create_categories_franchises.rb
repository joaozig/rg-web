class CreateCategoriesFranchises < ActiveRecord::Migration
  def change
    create_table :categories_franchises do |t|
      t.references :category, index: true, foreign_key: true
      t.references :franchise, index: true, foreign_key: true
    end
  end
end
