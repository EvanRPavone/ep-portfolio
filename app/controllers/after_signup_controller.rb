class AfterSignupController < ApplicationController
  include Wicked::Wizard
  # steps :profile, :avatar, :finish
  # Asterisk means variable number of arguments
  steps(*User.form_steps)

  def show
    @user = current_user

    case step
    when 'sign_up'
      skip_step if @user.persisted?
    when 'set_location'
      if @user.location.nil?
        @location = Location.new
      else
        @location = @user.location
      end
    when 'set_social'
      if @user.social.nil?
        @social = Social.new
      else
        @social = @user.social
      end
    when 'find_users'
      @users = User.all
    end

    render_wizard
  end

  def update
    @user = current_user
    case step
    when 'set_name'
      if @user.update(onboarding_params(step))
        render_wizard @user
      else
        render_wizard @user, status: :unprocessable_entity
      end
    when 'set_location'
      if @user.create_location(onboarding_params(step).except(:form_step))
        render_wizard @user
      else
        @location.destroy
        render_wizard @user, status: :unprocessable_entity
      end
    when 'set_social'
      if @user.create_social(onboarding_params(step).except(:form_step))
        render_wizard @user
      else
        @social.destroy
        render_wizard @user, status: :unprocessable_entity
      end
    end

  end

  private

  def finish_wizard_path
    root_path
  end

  def onboarding_params(step= 'sign_up')
    permitted_attributes =  case step
                            when 'set_name'
                              required_parameters = :user
                              %i[first_name last_name]
                            when 'set_location'
                              required_parameters = :location
                              %i[state country street city zip]
                            when 'set_social'
                              required_parameters = :social
                              %i[github linkedin website youtube twitter instagram discord]
                            end

    params.require(required_parameters).permit(:id, permitted_attributes).merge(form_step: step)
  end
end