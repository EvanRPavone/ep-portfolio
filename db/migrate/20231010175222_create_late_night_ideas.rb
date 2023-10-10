class CreateLateNightIdeas < ActiveRecord::Migration[7.0]
  def change
    create_table :late_night_ideas do |t|
      t.string :idea
      t.text :description
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
