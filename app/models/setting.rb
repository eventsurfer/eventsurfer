# frozen_string_literal: true

class Setting < ApplicationRecord
  def self.getSetting_as_list(name)
    if (s = Setting.find_by_key(name))
      v = s.value.gsub(/\s+/, "")
      l = v.split(",")
      return l
    else
      return {}
    end
  end

  def self.getMailAddresses
    m = Setting.getSetting_as_list("MAILTO")
    if m != {}
      return m
    else
      return "root@localhost"
    end
  end

  def self.getPaymentInfo
    m = Setting.getSetting_as_list("PAYMENT_INFO")
    if m != {}
      return m
    else
      return "no configuration was set"
    end
  end
end
