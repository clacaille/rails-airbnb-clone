class CreateCamps < ActiveRecord::Migration[5.0]
  def change
    create_table :camps do |t|
      t.string :title
      t.text :description
      t.string :country
      t.string :city
      t.string :long
      t.string :lat
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
