# frozen_string_literal: true
# TODO: delete cart
# TODO: session cart to performance with count
class Frontend::CartsController < ApplicationController
  def add_item
    t = Ticket.find(params[:id])
    if !@cart.include?(t.id)
      @cart.push(t.id)
    end

    unless current_user.nil?
      if PerformanceCart.find_by(performance_id: t.performance.id)
        p t.performance.id
        PerformanceCart.find_by(performance_id: t.performance.id).update(count: PerformanceCart.find_by(performance_id: (t.performance.id)).count + 1)
      else
        PerformanceCart.create(cart_id: Cart.find_by_user_id(current_user.id).id, performance_id: t.performance.id, count: 1)
      end
    end
    redirect_to(frontend_cart_path)
  end

  def list_items
    @items = []
    unless current_user.nil?
      PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id)).each do |item|
        @items.push(item)
      end
    else
      @cart.each do |id|
        @items.push(Ticket.find(id.to_i))
      end
    end

  end

  def remove_item
    @cart.delete(params[:id].to_i)
    p @cart
    redirect_to(frontend_cart_path)
  end


end
