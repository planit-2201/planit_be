FactoryBot.define do
  factory :daily_records do
    date { String(Faker::Date.in_date_period) }
    bag_count { Faker::Number.number(digits: 2) }
    container_count { Faker::Number.number(digits: 2) }
    straw_count { Faker::Number.number(digits: 2) }
    shower_time { Faker::Number.number(digits: 3) }
  end
end
