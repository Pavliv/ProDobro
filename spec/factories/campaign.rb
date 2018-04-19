FactoryBot.define do
  factory :valid_campaign, class: Campaign do
    sequence(:title) { |n| "Title #{n}" }
    description Faker::Book.title
    current_amount Faker::Number.decimal(2)
    needed_amount Faker::Number.decimal(2)
    requisite Faker::Number.number(16)
    finished_at Time.zone.now
    user
  end

  factory :invalid_campaign, class: Campaign do
    sequence(:title) { |n| "Title #{n}" }
    description Faker::Book.title
    current_amount Faker::Number.decimal(2)
    needed_amount Faker::Number.decimal(2)
    requisite Faker::Number.number(10)
    finished_at Time.zone.now
    user
  end
end
