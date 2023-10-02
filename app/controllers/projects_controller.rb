class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: %i[show index]

  # GET /projects or /projects.json
  def index
    @projects = Project.all.order(views: :desc)
  end

  # GET /projects/1 or /projects/1.json
  def show
    # Friendly ID
    # Project.find_each(&:save)
    @project.update(views: @project.views + 1)
    @comments = @project.comments.order(created_at: :desc)

    mark_notifications_as_read
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    @project.user = current_user

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])

      # If old id or numeric id was used to find the record, then
      # the request slug will not match the current slug, and we should do
      # a 301 redirect to the new path
      redirect_to @project, :status => :moved_permanently if params[:id] != @project.slug
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description, :user_id, :github, :website, :youtube)
    end

    def mark_notifications_as_read
      if current_user
        notifications_to_mark_as_read = @project.notifications_as_project.where(recipient: current_user)
        notifications_to_mark_as_read.update_all(read_at: Time.zone.now)
      end
    end
end
