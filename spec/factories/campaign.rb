FactoryBot.define do
  factory :campaign do
    sequence(:title) { |n| "Title #{n}" }
    description Faker::Book.title
    current_amount Faker::Number.decimal(2)
    needed_amount Faker::Number.decimal(2)
    requisite Faker::Number.number(16)
    finished_at Time.zone.now
    user
  end
end
