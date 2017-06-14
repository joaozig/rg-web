class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :birth
      t.integer :gender
      t.string :from
      t.references :neighborhood, index: true, foreign_key: true, null: true

      t.timestamps null: false
    end
  end
end
