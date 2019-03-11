# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if (!User.find_by_name("admin"))
  User.create!(name: "admin", email: 'admin@example.net', password: 'adminadmin', admin: true, enabled: true, confirmed_at: Date.today)
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
#Event.delete_all
if (Event.all.size<10)
  5.times do
    name = Faker::FunnyName.name
    start = Faker::Date.between(Date.today, Date.today.next_month)
    stop = Faker::Date.between(start, Date.today.next_month)
    hoster_name = Faker::Name.name
    website = Faker::StarWars.planets
    hotline = Faker::PhoneNumber.cell_phone_with_country_code
    description = Faker::Quotes
  end
end
#Performnace.delete_all
if (Performance.all.size < 20)
  10.times do
    prize = Random.rand(1..5).to_f
    start = Faker::Date.between(Date.today, Date.today.next_month)
    stop = Faker::Date.between(start, Date.today.next_year)
    stop_selling = Faker::Date.between(start, stop)
    number_of_tickets = Random.rand(50..100)
    Performance.create(prize: prize, start: start, stop: stop, stop_selling: stop_selling, number_of_tickets: number_of_tickets)
  end
end
if (PerformanceEvent.all.size < 40 )
  10.times do
    PerformanceEvent.create(event_id: Event.all[Random.rand(0..Event.all.size)], performance_id: Performance.all[0,Performance.all.size])
  end
end
if (Ticket.all.size < 200)
  Performance.all.each do |p|
    arr = []
    10.times do |t|

      ticket = Ticket.create(validate_id:"fffggg", valid_: true )
      arr.push(ticket.id)
    end
    arr.each do |t|
      PerformanceTicket.create(performances_id: p.id, tickets_id: t)
    end
  end

end