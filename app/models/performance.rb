class Performance < ApplicationRecord
  has_one :event
  has_many :tickets
end