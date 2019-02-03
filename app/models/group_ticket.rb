class GroupTicket < ApplicationRecord
  has_one :order
  has_many :tickets
end