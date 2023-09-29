class ApplicationController < ActionController::Base
  before_action :set_notifications, if: :current_user
  before_action :set_query

  def set_query
    @query = Project.ransack(params[:q])
  end

  private

  def set_notifications
    @unread = Notification.where(recipient: current_user).newest_first.limit(9).unread
    @read = Notification.where(recipient: current_user).newest_first.limit(9).read
  end
end
