FactoryBot.define do
  factory :comment do
    body Faker::Lorem.paragraph(5)
    association :commentable, factory: :news
    user
  end

  factory :news_valid_comment, class: Comment do
    body Faker::Lorem.paragraph(6)
    user
    association :commentable, factory: :news
  end

  factory :news_invalid_comment, class: Comment do
    body Faker::Lorem.paragraph(5)
    user
    association :commentable, factory: :news
  end

  factory :campaign_valid_comment, class: Comment do
    body Faker::Lorem.paragraph(6)
    user
    association :commentable, factory: :valid_campaign
  end

  factory :campaign_invalid_comment, class: Comment do
    body Faker::Lorem.paragraph(5)
    user
    association :commentable, factory: :valid_campaign
  end
end
