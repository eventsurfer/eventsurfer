# frozen_string_literal: true

class Api::V1::TicketsController < Api::V1::BaseController
  before_action :authenticate_client!

  def validate_ticket
    if params[:validate_id].present? && params[:ticket_id].present? && params[:user_id]
      begin
        @user = User.find(params[:user_id])
        @ticket = Ticket.find_by(id: params[:ticket_id])
        if @ticket.nil? || !@ticket.valid_
          if @ticket.nil?
            return api_error(status: 404, error: "Ticket wasn't found")
          else
            return api_error(status: 422, error: "Ticket was already used")
          end
        else
          if @ticket.validate_id == params[:validate_id]
            if @user.nil?
              return unauthenticated
            else
              @ticket.use_ticket(params[:user_id])
            end
            if @ticket.save
              render json: {ticket: @ticket, action: "used"}
            else
              return api_error()
            end
          else
            return api_error(status: 422, error: "validate id false")
          end
        end
      rescue
        api_error()
      end

    else
      if params[:ticket_id].present?
        return api_error(status: 400, error: "forget validate id")
      elsif params[:validate_id].present?
        return api_error(status: 400, error: "forget ticket id")
      else
        return bad_request
      end
    end
  end
end
