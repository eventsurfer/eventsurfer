# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController

  def create
    super do |resource|
      Cart.create(user_id: resource.id)
    end
  end

end
