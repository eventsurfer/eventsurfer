# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :is_admin?

  def default_url_options
    { locale: I18n.locale }
  end

  def is_admin?
    if current_user.admin

    else
      flash[:danger] = "You have no admin rights"
      sign_out current_user
      redirect_to root_path
    end
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end


end
