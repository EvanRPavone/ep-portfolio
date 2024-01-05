class ApplicationController < ActionController::Base
  include Pagy::Backend
  before_action :set_notifications, if: :current_user
  before_action :set_query
  # after_filter :set_csrf_cookie

  def set_query
    @query = Project.ransack(params[:q])
  end

  private

  def set_notifications
    notifications = Notification.includes(:recipient).where(recipient: current_user).newest_first.limit(9)
    @unread = notifications.unread
    @read = notifications.read
  end

  # def set_csrf_cookie
  #   if protect_against_forgery?
  #     cookies['XSRF-TOKEN'] = form_authenticity_token
  #   end
  # end

  # protected

  # def verified_request?
  #   super || valid_authenticity_token?(session, request.headers['X-XSRF-TOKEN'])
  # end
end
