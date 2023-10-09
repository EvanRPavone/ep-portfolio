class PagesController < ApplicationController
  def home
    # Create a scope that gets the most liked Portfolio or Project
    @trending_projects = Project.includes(:screenshots_attachments, :rich_text_description, screenshots_attachments: :blob).most_hit(Date.today.beginning_of_week, 3)
    @recent_projects = Project.includes(:screenshots_attachments, :rich_text_description, screenshots_attachments: :blob).order(created_at: :desc).first(6)
  end

  def about
  end

  def testing_area
    
  end
end
