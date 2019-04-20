# frozen_string_literal: true

class Api::V1::OrdersController < Api::V1::BaseController
  before_action :authenticate_client!

  def show
    respond_to :html, :pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test.pdf",
               template: "api/v1/orders/show.html.erb",
               layout: "pdf/test"
      end
    end
  end
end
