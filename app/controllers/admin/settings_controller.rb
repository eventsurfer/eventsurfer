# frozen_string_literal: true

class Admin::SettingsController < ApplicationController
  before_action :authenticate_user!

  def showApiKeys
    @apiKeys = ApiClient.all
  end

  def newApiKey
    @apiKey = ApiClient.new
  end

  def show
    @apiKey = ApiClient.find(params[:id])
  end

  def delete
    @apiKey = ApiClient.find(params[:id])
    if (@apiKey.destroy)
      redirect_to showApiKeys_admin_settings_path
    else
      flash[:warning] = "sth. went wrong"
    end
  end

  def create
    @apiKey = ApiClient.create(setting_parameter)
  end

end
