FactoryBot.define do
  factory :user do
    nickname { 'furima太郎' }
    email { Faker::Internet.free_email }
    password { '12345qwert' }
    password_confirmation { '12345qwert' }
    lastname { '田中' }
    firstname { '太郎' }
    lastname_kana { 'タナカ' }
    firstname_kana { 'タロウ' }
    birthday { '1930-01-01' }
  end
end
