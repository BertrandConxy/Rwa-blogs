FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    photo { Faker::Avatar.image }
    bio { Faker::Lorem.paragraph }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
