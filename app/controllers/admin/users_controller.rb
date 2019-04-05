# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  layout "adminDash"

  def index
    @users = User.all
  end

  def costumer
    @costumer = User.costumer
  end

  def employer
    @employer = User.employer
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end


  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to(admin_users_path)
    else
      render :edit
    end
  end


  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to(admin_users_url)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to admin_users_path
    end
  end

  private

    begin
      def user_params
        params.require(:user).permit(:name,
                                     :email,
                                     :enabled,
                                     :rank,
                                     :admin
        )
      end
    end
end
