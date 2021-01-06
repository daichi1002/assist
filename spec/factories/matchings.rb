FactoryBot.define do
  factory :matching do
    title { Faker::Lorem.sentence }
    need_id { 1 }
    detail { Faker::Lorem.sentence }
    end_date { Faker::Date.between(from: '2022-12-01', to: '2023-12-01') }
    contact_information { Faker::Lorem.sentence }
    url { Faker::Lorem.sentence }
    association :company
  end
end
