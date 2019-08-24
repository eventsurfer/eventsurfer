# frozen_string_literal: true

FactoryBot.define do
  factory :performance do
    prize {2.4}
    start {DateTime.now}
    stop {DateTime.now.next_month(2)}
    stop_selling {DateTime.now.next_month}
    number_of_tickets {10}
  end
  factory :unallowed_sell_performance, parent: :performance do
    sell_allowed {false}
  end
  factory :allowed_sell_performance, parent: :performance do
    sell_allowed{true}
  end
end
