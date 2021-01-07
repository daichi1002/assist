FactoryBot.define do
  factory :company do
    company_name { '株式会社ゲストログイン' }
    company_name_kana { 'カ）ゲストログイン' }
    email { Faker::Internet.email }
    password { 'test12345' }
    password_confirmation { password }
    postal_code { '1234567' }
    address { '宮崎県宮崎市宮崎1-1' }
    phone_number { '09012345678' }
    introduction { Faker::Lorem.sentence }
    staff { '田中' }
  end
end
