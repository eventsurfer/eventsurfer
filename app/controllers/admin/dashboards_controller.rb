# frozen_string_literal: true

class Admin::DashboardsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  layout "adminDash"

  def index
  end
end
