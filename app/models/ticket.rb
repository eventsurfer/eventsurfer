# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :event
  has_one :user
end
