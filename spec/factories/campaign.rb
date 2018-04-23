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

  factory :campaign_state_new, class: Campaign do
    sequence(:title) { |n| "Title #{n}" }
    description Faker::Book.title
    current_amount Faker::Number.decimal(2)
    needed_amount Faker::Number.decimal(2)
    requisite Faker::Number.number(16)
    finished_at Time.zone.now
    aasm_state 'new'
    user
  end

  factory :campaign_state_published, class: Campaign do
    sequence(:title) { |n| "Title #{n}" }
    description Faker::Book.title
    current_amount Faker::Number.decimal(2)
    needed_amount Faker::Number.decimal(2)
    requisite Faker::Number.number(16)
    finished_at Time.zone.now
    aasm_state 'published'
    user
  end

  factory :campaign_state_on_hold, class: Campaign do
    sequence(:title) { |n| "Title #{n}" }
    description Faker::Book.title
    current_amount Faker::Number.decimal(2)
    needed_amount Faker::Number.decimal(2)
    requisite Faker::Number.number(16)
    finished_at Time.zone.now
    aasm_state 'on_hold'
    user
  end

  factory :campaign_state_closed, class: Campaign do
    sequence(:title) { |n| "Title #{n}" }
    description Faker::Book.title
    current_amount Faker::Number.decimal(2)
    needed_amount Faker::Number.decimal(2)
    requisite Faker::Number.number(16)
    finished_at Time.zone.now
    aasm_state 'closed'
    user
  end
end
