# frozen_string_literal: true

class Admin::LocationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @locations = Location.all
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to(admin_location_path)
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
    @countries = Location.getAllCountries
  end

  def destroy
    @location = Location.find(params[:id])
    if (@location.destroy)
      flash[:success] = "Location was deleted successful"
      redirect_to(admin_location_path)
    else
      flash[:danger] = "Something went wrong"
    end
  end

  def update
    @location = Location.find(params[:id])
    if (@location.update(location_params))
      flash[:success] = "Location was edited successful"
      redirect_to(admin_location_path)
    else
      flash[:danger] = "Something went wrong"
      # redirect_to(edit_admin_location_path(params[:id]))
    end
  end

  def show
    @location = Location.find(params[:id])
    redirect_to "/admin/locations/"
  end

  private

    begin
      def location_params
        params.require(:location).permit(:street,
                                     :postcode,
                                     :country,
                                     :city,
                                     :street_number,
                                     :changed_by,
                                     :name
        )
      end
    end

end
