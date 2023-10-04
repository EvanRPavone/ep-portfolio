class UsersController < ApplicationController
  before_action :set_user
  def portfolio
    @pagy, @projects = pagy(@user.projects.includes([:rich_text_description]).sort_by_popularity('DESC'))
    @user.punch(request)
    @total_views = 0
    @user.projects.each do |project|
      @total_views += project.hits
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
