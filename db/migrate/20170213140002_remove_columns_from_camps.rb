class RemoveColumnsFromCamps < ActiveRecord::Migration[5.0]
  def change
    remove_column :camps, :country
    remove_column :camps, :city
    remove_column :camps, :long
    remove_column :camps, :lat
    add_column :camps, :price, :string
    add_column :camps, :address, :string
  end
end
