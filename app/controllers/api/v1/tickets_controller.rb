# frozen_string_literal: true

class Api::V1::TicketsController < Api::V1::BaseController
  before_action :authenticate_client!

  def validate_ticket
    if params[:validate_id].present? && params[:ticket_id].present?
      begin
        @ticket = Ticket.find_by(id: params[:ticket_id])
        if @ticket.nil? || !@ticket.valid_
          p @ticket
          render json: false
        else
          if @ticket.validate_id == params[:validate_id]
            render json: true
          else
            render json: "validate id false"
          end
        end
      rescue
        render json: "sth went wrong"
      end

    end
  end
end
