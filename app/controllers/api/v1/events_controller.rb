# frozen_string_literal: true

class Api::V1::EventsController < Api::V1::BaseController
  before_action :authenticate_client!
  def get
    render json: "test"
  end
end
