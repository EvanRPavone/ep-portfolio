class PopulateProjectCommentsCount < ActiveRecord::Migration[7.0]
  def change
    Project.all.each do |project|
      Project.reset_counters(project.id, :comments)
    end
  end
end
