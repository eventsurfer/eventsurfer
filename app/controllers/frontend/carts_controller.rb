# frozen_string_literal: true

class Frontend::CartsController < ApplicationController
  def add_item
    t = Ticket.find(params[:id])
    if !@cart.include?(t.id)
      @cart.push(t.id)
    end

    # unless current_user.nil?    end
    redirect_to(frontend_cart_path)
  end

  def list_items
    @items = []
    p @items
    p @cart
    @cart.each do |id|
      @items.push(Ticket.find(id.to_i))
    end
  end

  def remove_item
    @cart.delete(params[:id].to_i)
    p @cart
    redirect_to(frontend_cart_path)
  end


end