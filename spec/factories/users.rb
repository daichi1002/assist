FactoryBot.define do
  factory :user do
    first_name            { '田中' }
    last_name             { '太郎' }
    first_name_kana       { 'タナカ' }
    last_name_kana        { 'タロウ' }
    email                 { Faker::Internet.email }
    password              { 'test12345' }
    password_confirmation { password }
    state_id              { 1 }
    phone_number          { '09012345678' }
    birth_day             { Faker::Date.birthday }
  end
end
