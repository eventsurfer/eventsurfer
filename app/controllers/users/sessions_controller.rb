# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  def create
    super
    @cart.each do |element|
      PerformanceCart.create(cart_id: Cart.find_by_user_id(current_user.id).id, performance_id: element[0], count: element[1])
    end
  end

end
