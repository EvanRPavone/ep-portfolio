class PagesController < ApplicationController
  def home
    # Create a scope that gets the most liked Portfolio or Project
    @projects = Project.all
  end

  def about
  end

  def testing_area
    
  end
end
