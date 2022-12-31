FactoryBot.define do

  factory :part do
    name { Faker::Name.first_name }
    description { Faker::Hacker.say_something_smart }
    role { 'Manager' }
    photo { Faker::LoremFlickr.image }
    integrated { false }
  end
end
