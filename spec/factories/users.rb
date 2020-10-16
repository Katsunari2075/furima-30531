FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    birthday { '2000-7-5' }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    last_name { '田中' }
    first_name { '太郎' }
    kana_last_name { 'タナカ' }
    kana_first_name { 'タロウ' }
  end
end
