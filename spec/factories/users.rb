FactoryBot.define do
  factory :user do
    pass = Faker::Internet.password(min_length: 6)

    email                 { Faker::Internet.email }
    nickname              { Faker::Internet.username(specifier: 3..16) }
    password              { pass }
    password_confirmation { pass }
  end
end
