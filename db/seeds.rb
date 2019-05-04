# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if (!User.find_by_name("admin"))
  User.create!(name: "admin", email: 'admin@example.net', password: 'adminadmin', admin: true, enabled: true, confirmed_at: Date.today, role: "employer", rank: 4)
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
    User.create(name: name, email: Faker::Internet.unique.email(name), password: psswd, enabled: true, role: 1)
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
if (Event.all.size < 20)
  5.times do
    name = Faker::FunnyName.name
    start = Faker::Date.between(Date.today, Date.today.next_month)
    stop = Faker::Date.between(start, Date.today.next_month)
    hoster_name = Faker::Name.name
    website = Faker::FunnyName.name + ".net"
    hotline = Faker::PhoneNumber.cell_phone_with_country_code
    description = Faker::Movies::Hobbit.quote
    Event.create(name: name, start: start, stop: stop, hoster_name: hoster_name, website: website, hotline: hotline, description: description)
  end
end
#Performnace.delete_all
if (Performance.all.size < 30)
  11.times do
    prize = Random.rand(1..5).to_f
    start = Faker::Date.between(Date.today, Date.today.next_month)
    stop = Faker::Date.between(start, Date.today.next_year)
    stop_selling = Faker::Date.between(start, stop)
    number_of_tickets = Random.rand(50..100)
    Performance.create(prize: prize, start: start, stop: stop, stop_selling: stop_selling, number_of_tickets: number_of_tickets)
  end
end
# fix performancelocatin zeigen auf die gleiche performance und unterschiedliche locations
if (PerformanceEvent.all.size < 10)
  count = 1
  5.times do |i|
    p count
    p Event.all[i].id
    p Performance.all[count], Performance.all[count+1]
    PerformanceEvent.create(event_id: Event.all[i].id, performance_id: Performance.all[count].id)
    PerformanceEvent.create(event_id: Event.all[i].id, performance_id: Performance.all[count + 1].id)
    count +=2
  end
end
if (Ticket.all.size < 200)
  Performance.all.each do |p|
    arr = []
    10.times do |t|
      ticket = Ticket.create(validate_id: Ticket.generateValidateId, valid_: true)
      ticket.validate_id += "D" + ticket.id.to_s
      ticket.save
      arr.push(ticket.id)
    end
    arr.each do |t|
      PerformanceTicket.create(performance_id: p.id, ticket_id: t)
    end
  end

end
if (PerformanceLocation.all.size < 30)
  loc = Location.all
  count = 0
  Performance.all.each do |per|
    PerformanceLocation.create(performance_id: per.id, location_id: loc[count].id)
    PerformanceLocation.create(performance_id: per.id, location_id: loc[count + 1].id)
    count += 1
  end
end
if (!ApiClient.find_by_name("testi"))
  ApiClient.create(name: "testi", auth_key: "welovetoentertainyou")
end

if (Cart.all.size < 10)
  10.times do |i|
    this_cart = Cart.create(user_id: i + 1)
    5.times do
      PerformanceCart.create(cart_id: this_cart.id, performance_id: rand(1...15), count: rand(1...6))
    end
  end
end

if (Order.all.size < 10)
  10.times do |i|
    this_order = Order.create(user_id: i + 1)
    PerformanceCart.where(cart_id: Cart.find_by_user_id(i + 1)).each do |item|
      GroupTicket.create(performance_id: item.performance_id, count: item.count, order_id: this_order.id)
    end
  end
end
if (DefaultInformation.all.empty?)
  street = Faker::Address.street_name
  number = Faker::Address.street_suffix
  country = Faker::Address.country
  city = Faker::Address.city
  postcode = Faker::Address.postcode
  name = Faker::Company.industry
  website = Faker::FunnyName.name + ".net"
  DefaultInformation.create(company: name, street: street, street_number: number.to_s, country: country, city: city, postcode: postcode.to_s, cellphone: Faker::PhoneNumber.cell_phone_with_country_code, website: website, email: Faker::Internet.unique.email(name), changed_by: 1)
end
