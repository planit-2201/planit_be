require 'faker'
FactoryBot.define do
  factory :user do
    username { 'Faker::FunnyName.name' }
    flowrate { [1.8, 2.1, 2.5].sample }
  end
end