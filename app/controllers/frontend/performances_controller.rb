# frozen_string_literal: true

class Frontend::PerformancesController < ApplicationController
  def show
    @performance = Performance.find(params[:id])
  end
end
