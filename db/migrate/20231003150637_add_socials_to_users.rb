class AddSocialsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :github, :string
    add_column :users, :linkedin, :string
    add_column :users, :website, :string
    add_column :users, :youtube, :string
    add_column :users, :twitter, :string
    add_column :users, :instagram, :string
    add_column :users, :discord, :string
  end
end
