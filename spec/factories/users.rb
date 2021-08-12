FactoryBot.define do
  factory :user do
    firstname { Faker::Name.first_name }
    lastname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { "100100" }
    password_confirmation { password }
    confirmed_at { 1.hour.ago }
  end
  trait :not_confirmed do
    confirmed_at { nil }

    after(:create) do |user|
      user.update(confirmation_sent_at: 3.days.ago)
    end
  end
end
