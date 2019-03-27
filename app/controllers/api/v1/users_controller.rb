# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::BaseController
  before_action :authenticate_client!

  def signIn
    if (params[:user_email].present? && params[:passwd].present?)
      @user = User.find_by(:email => params[:user_email])
      if (@user.nil?)
        return not_found
      else
        if @user.valid_password?(params[:passwd])
          render json: {user: @user, action: "sign in"}
        else
          return unauthenticated
        end
      end
    else
      return bad_request
    end
  end
end