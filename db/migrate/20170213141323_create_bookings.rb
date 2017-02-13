class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.integer :surfers
      t.datetime :start_date
      t.datetime :end_date
      t.references :user, foreign_key: true
      t.references :camp, foreign_key: true
      t.boolean :accepted

      t.timestamps
    end
  end
end
