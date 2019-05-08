# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_locale
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_cart

  private

    def set_cart
      if session[:cart]
        @cart = session[:cart]
      else
        session[:cart] = []
        @cart = session[:cart]
      end
    end
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
        flash[:alert] = "You have no admin rights"
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
      if request.env["HTTP_ACCEPT_LANGUAGE"]
        request.env["HTTP_ACCEPT_LANGUAGE"].scan(/^[a-z]{2}/).first
      end
    end

end
