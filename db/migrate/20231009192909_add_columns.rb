class AddColumns < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :avatar, :string
    add_column :projects, :screenshots, :json
  end
end
