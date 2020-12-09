FactoryBot.define do
  factory :contact do
    name: { Faker::Name.name}
    email: { Faker::Internet.email }
    content: { Faker::Lorem.sentence }
  end
end
