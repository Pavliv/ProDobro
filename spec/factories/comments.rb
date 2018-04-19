FactoryBot.define do
  factory :comment do
    association :commentable, factory: news
    body Faker::Lorem.paragraph(5)
    user
  end
end
