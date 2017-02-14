class AddPhotoToCamp < ActiveRecord::Migration[5.0]
  def change
    add_column :camps, :photo, :string
  end
end
