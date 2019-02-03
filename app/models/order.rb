class Order < ApplicationRecord
  has_one :group_ticket
  has_one :user

end