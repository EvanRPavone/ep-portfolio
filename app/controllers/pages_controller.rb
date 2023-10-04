class PagesController < ApplicationController
  def home
    # Create a scope that gets the most liked Portfolio or Project
    @projects = Project.includes(:screenshots_attachments, :rich_text_description).order(created_at: :desc).first(6)
  end

  def about
  end

  def testing_area
    
  end
end
