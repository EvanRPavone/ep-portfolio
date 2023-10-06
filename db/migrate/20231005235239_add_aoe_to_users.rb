class AddAoeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :aoe, :string, null: false, default: "Portfoliyours User"
  end
end
