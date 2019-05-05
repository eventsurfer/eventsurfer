# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :group_ticket
  has_one :user
  scope :paid, -> {where(paid: true)}
  scope :unpaid, ->{where(paid: false)}

  # def self.getDataSorted
  #  back = {}
  #  tmp = {}
  #  orders = Order.paid
  #  orders.each do |order|
  #    tmp[order.user_id] = GroupTicket.where(:order_id => order.id)
  #  end
  #  back[:paid] = tmp
  #  tmp = {}
  #  orders = Order.unpaid
  #  orders.each do |order|
  #    tmp[order.user_id] = GroupTicket.where(:order_id => order.id)
  #  end
  #  back[:unpaid] = tmp
  #  return back
  # end

  def self.getDataSorted
    back = {paid: [], unpaid: []}
    tmp_paid = {}
    Order.all.each do |order|
      if (order.paid?)
        back[:paid][User.find(order.user_id).name] += order
      else
        back[:unpaid].push(order)
      end
    end
    return back
  end

  def self.paid_grouped
    userOrder = []
    back = {}
    Order.paid.each {|order|userOrder.push(order.id) unless userOrder.include?(order.id) }
    userOrder.each do |user|
      back[user] = Order.where(user_id: user)
    end
    return back
  end
  def self.unpaid_grouped
    userOrder = []
    back = {}
    Order.unpaid.each {|order|userOrder.push(order.id) unless userOrder.include?(order.id) }
    userOrder.each do |user|
      back[user] = Order.where(user_id: user)
    end
    return back
  end
end
