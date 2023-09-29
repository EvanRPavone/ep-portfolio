class SearchController < ApplicationController
  def index
    @query = Project.ransack(params[:q])
    @project = @query.result(distinct: true)
  end
end
