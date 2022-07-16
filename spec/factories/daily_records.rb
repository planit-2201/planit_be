FactoryBot.define do
  factory :daily_record do
    bag_count { (0..5).to_a.sample }
    bottle_count { (0..3).to_a.sample }
    straw_count { (0..2).to_a.sample }
    shower_time { (180..290).to_a.append(0).sample}
  end
end
