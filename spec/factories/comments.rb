FactoryBot.define do
  factory :comment do
    body Faker::Lorem.paragraph(5)
    association :commentable, factory: :news
    user
  end

  factory :valid_comment, class: Comment do
    body Faker::Lorem.paragraph(6)
    association :commentable, factory: :news
    user
  end

  factory :invalid_comment, class: Comment do
    body Faker::Lorem.paragraph(5)
    association :commentable, factory: :news
    user
  end
end
