# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :group_ticket
  has_one :user
  scope :paid, -> {where(paid: true)}
  scope :unpaid, ->{where(paid: false)}

  def self.paid_grouped
    userOrder = []
    back = {}
    Order.paid.each {|order|userOrder.push(order.user_id) unless userOrder.include?(order.user_id) }
    p userOrder
    userOrder.each do |user|
      back[user] = Order.paid.where(user_id: user)
    end
    return back
  end
  def self.unpaid_grouped
    userOrder = []
    back = {}
    Order.unpaid.each {|order|userOrder.push(order.user_id) unless userOrder.include?(order.user_id) }
    userOrder.each do |user|
      back[user] = Order.unpaid.where(user_id: user)
    end
    return back
  end

  def setPaid(current)
    self.changed_by = current.id
    self.paid = true
    self.paid_at = DateTime.now
    if self.save

    end
  end

  def setUnPaid(current)
    self.changed_by = current.id
    self.paid = false
    self.paid_at = nil
    if self.save

    end
  end
end
