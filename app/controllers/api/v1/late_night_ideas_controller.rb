class Api::V1::LateNightIdeasController < ApplicationController
  before_action :set_late_night_idea, only: %i[ show update destroy ]

  # GET /late_night_ideas
  # GET /late_night_ideas.json
  def index
    @late_night_ideas = LateNightIdea.order(created_at: :desc)

    render json: @late_night_ideas
  end

  # GET /late_night_ideas/1
  # GET /late_night_ideas/1.json
  def show
    render json: @late_night_idea
  end

  # POST /late_night_ideas
  # POST /late_night_ideas.json
  def create
    @late_night_idea = LateNightIdea.new(late_night_idea_params)

    if @late_night_idea.save
      render :show, status: :created, location: @late_night_idea
    else
      render json: @late_night_idea.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /late_night_ideas/1
  # PATCH/PUT /late_night_ideas/1.json
  def update
    if @late_night_idea.update(late_night_idea_params)
      render :show, status: :ok, location: @late_night_idea
    else
      render json: @late_night_idea.errors, status: :unprocessable_entity
    end
  end

  # DELETE /late_night_ideas/1
  # DELETE /late_night_ideas/1.json
  def destroy
    @late_night_idea.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_late_night_idea
      @late_night_idea = LateNightIdea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def late_night_idea_params
      params.require(:late_night_idea).permit(:id, :user_id, :idea, :description)
    end
end
