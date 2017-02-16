class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :description
      t.integer :rating
      t.references :user, foreign_key: true
      t.references :camp, foreign_key: true

      t.timestamps
    end
  end
end
