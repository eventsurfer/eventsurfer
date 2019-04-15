# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :is_admin?

  def set_locale
    I18n.locale = params[:locale] || extract_locale_from_header || I18n.default_locale
    logger.debug "* Locale set to '#{I18n.locale}'"
  end

  def default_url_options
    {locale: I18n.locale}
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

  private

  def extract_locale_from_header
    request.env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/).first
  end

end
