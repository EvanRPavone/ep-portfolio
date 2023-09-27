class AddViewsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :views, :integer, default: 0
  end
end
