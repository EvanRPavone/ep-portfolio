class UsersController < ApplicationController
  before_action :set_user
  def portfolio
    @pagy, @projects = pagy(@user.projects.includes([:rich_text_description]).order(views: :desc))
    @user.update(views: @user.views + 1)
    @total_views = 0
    @projects.each do |proj|
      @total_views += proj.views
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
