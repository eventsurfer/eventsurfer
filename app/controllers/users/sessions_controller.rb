# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    super
    @cart.each do |element|
      x = PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id).id, performance_id: element[0])
      if x.size > 0
        x.update(count: x.count + element[1])
      else
        PerformanceCart.create(cart_id: Cart.find_by_user_id(current_user.id).id, performance_id: element[0], count: element[1])
      end
    end

    PerformanceCart.where(cart_id: Cart.find_by_user_id(current_user.id).id).each do |pc|
      exist = false
      @cart.each do |element|
        if element[0] == pc.performance_id
          element[1] = pc.count
          exist = true
        end
      end
      unless exist
        @cart.push([pc.id, pc.count])
      end
    end
  end
end

