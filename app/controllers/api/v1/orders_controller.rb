# frozen_string_literal: true

class Api::V1::OrdersController < Api::V1::BaseController
  # before_action :authenticate_client!

  def show
    respond_to :html, :pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test.pdf",
               template: "api/v1/orders/show.html.erb",
               layout: "pdf/test",
               page_size: "A4"

      end
    end
  end

  def order
    respond_to :html, :pdf
    @info = DefaultInformation.first
    @order = nil# Order.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "order.pdf",
               template: "layouts/pdf/order1.html.erb",
               layout: "pdf/test.html.erb"
      end
    end
  end

  def test1
    respond_to :html, :pdf
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "test.pdf", template: "api/v1/orders/test1.html.erb", layout: "pdf/test"
      end
    end
  end
  def example
    render "layouts/pdf/example/template.html.erb"
  end
end
