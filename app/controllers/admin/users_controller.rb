# frozen_string_literal: true

class Admin::UsersController < ApplicationController
  # noinspection RailsParamDefResolve
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :checkPermission!
  layout "adminDash"
  # TODO: discuss user management system
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
    @user.changed_by = current_user.id
    if @user.update(user_params)
      if @user.role == "costumer"
        redirect_to costumer_admin_users_path
      else
        redirect_to employer_admin_users_path
      end
    else
      render :edit
    end
  end


  def create
    @user = User.new(user_params)
    @user.changed_by = current_user.id
    if @user.save
      Cart.create(user_id: @user.id)
      redirect_to(admin_users_url)
    else
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.changed_by = current_user.id
    if @user.destroy
      redirect_to admin_users_path
    end
  end

  private

    begin
      def user_params
        params.require(:user).permit(:name,
                                     :email,
                                     :rank,
                                     :admin,
                                     :password,
                                     :password_confirmation
        )
      end

      def checkPermission!
        if current_user.rank >= 4
        else
          redirect_to admin_dashboards_path
        end
      end
    end
end
