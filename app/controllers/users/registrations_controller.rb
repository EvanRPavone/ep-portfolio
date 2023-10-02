# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  def update
    current_user.build_location(location_params) unless current_user.location
    current_user.location.update(location_params)
    current_user.build_social(social_params) unless current_user.social
    current_user.social.update(social_params)
    super
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:email,
                                                              :first_name,
                                                              :last_name,
                                                              :password,
                                                              :phone_number,
                                                              :password_confirmation,
                                                              :current_password,
                                                              { location: %i[state country] },
                                                              { social: %i[github linkedin website youtube twitter instagram discord] }])
  end

  def after_sign_up_path_for(resource)
    after_signup_path('set_name')
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  def location_params
    params.require(:location).permit(:id, :state, :country)
  end

  def social_params
    params.require(:social).permit(:id, :github, :linkedin, :website, :youtube, :twitter, :instagram, :discord)
  end
end
