users = []
20.times do
  user = User.create!(
    first_name: Faker::HitchhikersGuideToTheGalaxy.character.to_s,
    last_name: Faker::HitchhikersGuideToTheGalaxy.planet.to_s,
    email: Faker::Internet.email,
    password: "password"
    # avatar: Faker::Avatar.image
    )
  users << user
end

15.times do
  spaceship = Spaceship.new(
    name: Faker::Company.name,
    captain: Faker::StarTrek.character,
    location: Faker::Address.city,
    speed: (1000..3000).to_a.sample,
    capacity: (5..25).to_a.sample,
    price_per_day: (1000..6000).to_a.sample,
    user_id: users.sample.id,
  )
  spaceship.remote_photo_url = 'https://source.unsplash.com/1600x900/?spaceship'
  spaceship.save!
end
