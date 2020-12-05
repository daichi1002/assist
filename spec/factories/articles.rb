FactoryBot.define do
  factory :article do
    title { Faker::Lorem.sentence }
    genre_id { 1 }
    type_id { 1 }
    area_id { 1 } 
    maximum_price { Faker::Number.between(from: 0, to: 99_999_999) }
    start_date { Faker::Date.between(from: '2020-12-01', to: '2021-12-01') }
    end_date { Faker::Date.between(from: '2022-12-01', to: '2023-12-01') }
    information { Faker::Lorem.sentence }
    url { Faker::Lorem.sentence }
    association :user
  end
end