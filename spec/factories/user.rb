FactoryBot.define do
  factory :user do
    name Faker::Name.first_name
    surname Faker::Name.last_name
    email Faker::Internet.email
    password '369852'
    password_confirmation '369852'
  end
end
