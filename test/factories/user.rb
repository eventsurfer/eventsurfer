# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.safe_email}
    password {"testtest"}
    admin {false}
    rank {0}
    confirmed_at {DateTime.now}
  end
  factory :admin_user2, parent: :user do
    admin {true}
    rank {2}
  end
  factory :admin_user3, parent: :user do
    admin {true}
    rank {3}
  end
  factory :admin_user, parent: :user do
    admin {true}
    rank {4}
  end
end
