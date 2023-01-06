require 'faker'

User.destroy_all
Part.destroy_all

3.times do
  User.create!(
    username: Faker::Name.first_name,
    email: Faker::Internet.email
  )
end

15.times do
  Faker::LoremFlickr.unique.clear
  Part.create!(
    name: Faker::Superhero.name,
    description: Faker::Hacker.say_something_smart,
    role: 'Manager',
    photo: "#{Faker::LoremFlickr.unique.image}/#{Faker::Name.first_name}",
    integrated: false,
    # This is brittle and depends on how many users are created above. Not sure if there's a better way. 
    user_id: rand(1..3)
  )
end

p "Created #{User.count} users and #{Part.count} parts"
