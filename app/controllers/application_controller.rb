# frozen_string_literal: true

class ApplicationController < ActionController::Base
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
