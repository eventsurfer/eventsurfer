# frozen_string_literal: true

class Admin::ApiClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  layout "adminDash"

  def index
    @clients = ApiClient.all
  end

  def new
    @api_client = ApiClient.new
  end

  def create
    @api_client = ApiClient.new(api_client_params)
    if @api_client.save
      redirect_to admin_api_clients_url
    else
      render :new
    end
  end

  def edit
    @api_client = ApiClient.find(params[:id])
  end

  def update
    @api_client = ApiClient.find(params[:id])
    if @api_client.update(api_client_params)
      redirect_to admin_api_clients_url
    else
      render :edit
    end
  end

  def destroy
    @api_client = ApiClient.find(params[:id])
    @api_client.destroy
    redirect_to admin_api_clients_url()
  end

  private
    begin
      def api_client_params
        params.require(:api_client).permit(:name, :ip_address)
      end
    end
end
