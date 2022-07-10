FactoryBot.define do
  factory :user do
    username { Faker::FunnyName.name }
    flowrate { Faker::Number.decimal(l_digits: 1) }
  end
end
