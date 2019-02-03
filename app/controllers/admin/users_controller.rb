# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    User.new()
  end

  def edit
    @user = User.find(params[:id])
  end


  def show
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(admin_users_url)
    else
      render :new
    end
  end

  private

  begin
    def user_params
      params.require(:user).permit(:name,
                                   :email,
                                   :psswrd,
                                   :enabled,
                                   :admin
      )
    end
  end
end
