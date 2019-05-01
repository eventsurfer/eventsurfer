# frozen_string_literal: true

class ApiClient < ActiveRecord::Base
  before_create :generate_auth_key

  def generate_auth_key
    loop do
      self.auth_key = SecureRandom.urlsafe_base64(64)
      break unless ApiClient.find_by(auth_key:
                                         auth_key)
    end
  end

  def authenticate(key)
    if self.auth_key == key
      return true
    end
    return false
  end

end
