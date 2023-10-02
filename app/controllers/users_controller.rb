class UsersController < ApplicationController
  before_action :set_user
  def portfolio
    @projects = Project.includes([:rich_text_description]).order(views: :desc).where(user_id: @user.id)
    @user.update(views: @user.views + 1)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
