module Api
  module V1
    class LateNightIdeasController < ApiController
      def index
        @late_night_ideas = current_user.feed.paginate(page: params[:page])
      end
    end
  end
end