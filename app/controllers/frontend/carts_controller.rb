# frozen_string_literal: true

class Frontend::CartsController < ApplicationController
  def add_item
    t = Performance.find(params[:id])
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
        @items.push([Performance.find(item.performance_id), item.count])
      end
    else
      @cart.each do |item|
        @items.push([Performance.find(item[0]), item[1]])
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

  def checkout
    if current_user.nil?
      redirect_to new_user_session_path, alert: "Please log in"
    else
      if PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id)).all.size > 0
        not_free = []
        PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id)).each do |item|
          if item.count.to_i > Performance.find(item.performance_id).tickets.where(reserved: 0).size
            not_free.append(item)
          end
        end
        if not_free.size > 0
          p "not free"
          redirect_to frontend_path # TODO: not free msg
        else
          @items = []
          PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id)).each do |item|
            @items.push([item.performance_id, item.count])
          end
        end
      else
        p "korb leer"
        redirect_to frontend_path # TODO: wo anders hin und fehler msg
      end
    end
  end

  def order
    method = params[:pay_method].to_i
    not_free = []
    PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id)).each do |item|
      if item.count.to_i > Performance.find(item.performance_id).tickets.where(reserved: 0).size
        not_free.append(item)

      else
        item.count.to_i.times do
          p item.performance_id
          Performance.find(item.performance_id).tickets.where(reserved: 0).first.update(reserved: 1)
        end
      end

      if not_free.size > 0
        p "not free"
        redirect_to frontend_path # TODO: not free msg

      else
        this_order = Order.create(user_id: current_user.id, payment_method: method)
        PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id)).each do |item|
          gp = GroupTicket.create(performance_id: item.performance_id, count: item.count, order_id: this_order.id)
          item.count.to_i.times do
            Performance.find(item.performance_id).tickets.where(reserved: 1, group_id: 0).first.update(group_id: gp.id)
          end
        end
        PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id)).delete_all
        redirect_to frontend_success_path
      end

      def success
        @order = Order.where(user_id: current_user.id).last
      end

    end
  end
end
