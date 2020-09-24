FactoryBot.define do
  factory :offer do
    advertiser_name { Faker::Company.name }
    description { Faker::Lorem.paragraph_by_chars(number: 100, supplemental: false) }
    url { Faker::Internet.url }
    starts_at { Time.current }

    trait :diabled do
      starts_at { Time.current - 2.days }
      ends_at { Time.current - 1.day }
    end
  end
end
