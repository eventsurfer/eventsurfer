# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    user_id {1}
  end

  factory :unpaid, parent: :order do
    paid {false}
  end

  factory :paid, parent: :order do
    paid {true}
    paid_at {DateTime.now}
  end
end
