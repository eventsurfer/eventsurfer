# frozen_string_literal: true

class Ticket < ApplicationRecord
  has_one :performance
end
