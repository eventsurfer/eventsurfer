# frozen_string_literal: true

ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "simplecov"

SimpleCov.start do
  add_filter "/test/"
  add_filter "/config/"
  add_filter "/vendor/"
  add_group "Models", "app/models"
  add_group "Controllers", "app/controllers"
  add_group "Helpers", "app/helpers"
end
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  include FactoryBot::Syntax::Methods
  FactoryBot.find_definitions

  # Add more helper methods to be used by all tests here...
  def is_logged_in?
    !session[:user_id].nil?
  end

  def log_in_as(user)
    session[:user_id] = user.id
  end

end
class ActionDispatch::IntegrationTest
  def log_in_as(user, password: "testtest")
    post new_user_session_path, params: {session: {email: user.email,
                                                   password: password}}
  end
end
