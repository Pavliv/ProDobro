FactoryBot.define do
  factory :news do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraph(4)
    user
  end

  factory :valid_news, class: News do
    title Faker::Lorem.characters(3)
    description Faker::Lorem.characters(10)
    user
  end

  factory :invalid_news, class: News do
    title Faker::Lorem.characters(2)
    description Faker::Lorem.characters(10)
    user
  end
end
