class AddLocationToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :location, foreign_key: true
    add_column :users, :phone_number, :string
  end
end
