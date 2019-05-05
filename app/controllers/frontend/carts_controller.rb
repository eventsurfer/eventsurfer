# frozen_string_literal: true

class Frontend::CartsController < ApplicationController
  def add_item
    t = Ticket.find(params[:id]).performance
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
      pc = PerformanceCart.find_by(cart_id: Cart.find_by_user_id(current_user.id).id, performance_id: t.id)
      if pc
        pc.update(count: pc.count + 1)
      else
        PerformanceCart.create(cart_id: Cart.find_by_user_id(current_user.id).id, performance_id: t.id, count: 1)
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

  def update
    id = params[:id].to_i
    count = params[:count].to_i

    @cart.each do |element|
      if element[0] == id
        element[1] = count
      end
    end

    unless current_user.nil?
      PerformanceCart.find_by(cart_id: Cart.find_by_user_id(current_user.id).id, performance_id: id).update(count: count)
    end
    redirect_to(frontend_cart_path)
  end

  def remove_item
    id = params[:id].to_i
    @cart.each do |element|
      if element[0] == id
        @cart.delete(element)
      end
    end

    unless current_user.nil?
      PerformanceCart.find_by(cart_id: Cart.find_by_user_id(current_user.id).id, performance_id: id).delete
    end
    redirect_to(frontend_cart_path)
  end

  def create_order
    if current_user.nil?
      redirect_to(new_user_session_path) # TODO: flash msg
    else
      this_order = Order.create(user_id: current_user.id)
      PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id)).each do |item|
        GroupTicket.create(performance_id: item.performance_id, count: item.count, order_id: this_order.id)
      end
    end
  end

end
