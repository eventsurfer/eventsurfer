# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if (!User.find_by_name("admin"))
  User.create!(name: "admin", email: 'admin@example.net', password: 'adminadmin', admin: true, enabled: true)
end

def fake_name()
  i = rand(0..2)
  case i
  when 0
    return Faker::TvShows::RickAndMorty.character
  when 1
    return Faker::Movies::LordOfTheRings.character
  when 2
    return Faker::TvShows::HeyArnold.character
  else
    # type code here
  end
end


#User
if (User.all.size < 20)
  10.times do
    name = fake_name
    psswd = "password"
    User.create(name: name, email: Faker::Internet.unique.email(name), encrypted_password: psswd, enabled: true)
  end
end
#Location.delete_all
if (Location.all.size < 40)
  20.times do
    street = Faker::Address.street_name
    number = Faker::Address.street_suffix
    country = Faker::Address.country
    city = Faker::Address.city
    postcode = Faker::Address.postcode
    name = Faker::Company.industry
    Location.create(name: name, street: street, street_number: number.to_s, country: country, city: city, postcode: postcode.to_s)
  end
end
