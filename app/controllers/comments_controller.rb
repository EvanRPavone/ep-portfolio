class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project

  def create
    @comment = @project.comments.create(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment has been created"
      redirect_to project_path(@project)
    else
      flash[:notice] = "Comment failed to create"
      redirect_to project_path(@project)
    end
  end

  def destroy
    @comment = @project.comments.find(params[:id])
    @comment.destroy
    redirect_to project_path(@project)
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end

end
