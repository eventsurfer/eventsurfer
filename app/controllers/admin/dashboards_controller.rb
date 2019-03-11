# frozen_string_literal: true

class Admin::DashboardsController < ApplicationController
  before_action :authenticate_user!
  layout "adminDash"

  def index
  end
end
