# frozen_string_literal: true

class Order < ApplicationRecord
  has_one :group_ticket
  has_one :user
  scope :paid, -> {where(paid: true)}
  scope :unpaid, ->{where(paid: false)}

  #def self.getDataSorted
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
  #end

  def self.getDataSorted
    back = {paid:[],unpaid:[]}
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
end
