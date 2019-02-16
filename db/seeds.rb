# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:"admin",email: 'admin@example.com', encrypted_password: 'adminadmin', admin:true, enabled:true)
def fake_name()
  i = rand(0..2)
  case i
  when 0
    return Faker::RickAndMorty.character
  when 1
    return Faker::LordOfTheRings.character
  when 2
    return Faker::HeyArnold.character
  else
    # type code here
  end
end




#User
10.times do
  name = fake_name
  psswd = "password"
  User.create(name: name, email: Faker::Internet.unique.email(name), encrypted_password: psswd, enabled:true )
end