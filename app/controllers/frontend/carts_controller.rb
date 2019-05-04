# frozen_string_literal: true

# TODO: delete cart
# TODO: session cart to performance with count
class Frontend::CartsController < ApplicationController
  def add_item
    t = Ticket.find(params[:id])
    exist = false
    @cart.each do |element|
      if element[0] == t.id
        element[1] = element[1] + 1
        exist = true
      end
    end
    unless exist
      @cart.push([t.id, 1])
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
        @items.push([item.performance_id, item.count])
      end
    else
      @cart.each do |item|
        @items.push(item)
      end
    end
  end

  def remove_item
    @cart.delete(params[:id].to_i)
    p @cart
    redirect_to(frontend_cart_path)
  end

  def createOrder
    this_order = Order.create(user_id: current_user.id)
    PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id)).each do |item|
      GroupTicket.create(performance_id: item.performance_id, count: item.count, order_id: this_order.id)
    end
    OrderMailer.entry_order(this_order).deliver
    redirect_to root_path
  end

end
