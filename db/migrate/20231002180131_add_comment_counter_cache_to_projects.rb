class AddCommentCounterCacheToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :comments_count, :integer
  end
end
