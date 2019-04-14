FactoryBot.define do
  factory :location do
    street {Faker::Address.street_name}
    street_number {Faker::Address.street_suffix.to_s}
    country {Faker::Address.country}
    city {Faker::Address.city}
    postcode {Faker::Address.postcode.to_s}
    name {Faker::Company.name}
  end

end
