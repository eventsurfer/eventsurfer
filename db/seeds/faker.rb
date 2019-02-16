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
  psswd = Faker::Internet.password(5,20)
  User.create(name: name, email: Faker::Internet.unique.email(name), encrypted_password: psswd, enabled:true )
end