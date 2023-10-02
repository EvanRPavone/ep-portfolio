class CreateSocials < ActiveRecord::Migration[7.0]
  def change
    create_table :socials do |t|
      t.string :github
      t.string :linkedin
      t.string :website
      t.string :youtube
      t.string :twitter
      t.string :instagram
      t.string :discord
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_reference :users, :social, foreign_key: true
  end
end
