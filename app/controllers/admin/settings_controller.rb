# frozen_string_literal: true

class Admin::SettingsController < ApplicationController
  before_action :authenticate_user!
  layout "adminDash"
  def index
    @settings = Setting.all
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
    if @setting.update(setting_params)
      redirect_to admin_settings_url,
                  notice: "Setting was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @setting = Setting.find(params[:id])
    @setting.destroy
    redirect_to admin_settings_url,
                notice: "Setting was successfully destroyed."
  end

  private
  begin
    def setting_params
      params.require(:setting).permit(:key, :value)
    end
  end
end
