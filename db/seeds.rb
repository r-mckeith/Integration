require 'faker'

Part.destroy_all

15.times do
  Faker::LoremFlickr.unique.clear
  Part.create!(
    name: Faker::Superhero.name,
    description: Faker::Hacker.say_something_smart,
    role: 'Manager',
    photo: "#{Faker::LoremFlickr.unique.image}/#{Faker::Name.first_name}",
    integrated: false
  )
end

p "Created #{Part.count} parts"
