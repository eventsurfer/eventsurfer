# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    validate_id {"asdfasdf"}
    created_at {DateTime.now}
    valid_ {true}
  end
end
