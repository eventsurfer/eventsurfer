# frozen_string_literal: true

class Admin::SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :checkPermission!
  layout "adminDash"

  def index
    @settings = Setting.all
    @default_info = DefaultInformation.first
  end

  def new
    @setting = Setting.new
  end

  def edit
    @setting = Setting.find(params[:id])
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to admin_settings_url,
                  notice: "Setting was successfully created."
    else
      render :new
    end
  end

  def update
    @setting = Setting.find(params[:id])
    if @setting.update(setting_params[:setting])
      redirect_to admin_settings_url,
                  notice: "Setting was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @setting = Setting.find(params[:id])
    if @setting.destroy
      redirect_to admin_settings_url,
                  notice: "Setting was successfully destroyed."
    else
    end
  end

  def defaultInfo
    @default_info = DefaultInformation.first
    if @default_info.update(setting_params)
      redirect_to admin_settings_path
    else

    end
  end

  private

    begin
      def setting_params
        if params.key?(:default_information)
          params.require(:default_information).permit(:company, :street, :country, :city, :postcode, :street_number, :cellphone, :email, :website)
        else
          params.require(:setting).permit(:key, :value)
        end
        end

      def checkPermission!
        if current_user.rank >= 3

        else
          redirect_to admin_dashboards_path
        end
      end
    end
end
