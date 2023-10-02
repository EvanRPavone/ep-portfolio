class AdminController < ApplicationController
  def index
  end

  def projects
    @projects = Project.all.includes(:user, :comments)
  end

  def comments
    @comments = Comment.all.includes(:user)
  end

  def users
    @users = User.all.includes(:projects, :comments)
  end

  def show_project
    @project = Project.includes(:user, :comments).find(params[:id])
    @comments = @project.comments.includes(:user)
  end
end
