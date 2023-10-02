class AddAddressToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :address, foreign_key: true
    add_column :users, :phone_number, :string
  end
end
