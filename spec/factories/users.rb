
FactoryBot.define do
  factory :user do
    username { ['jerrybot', 'tombot', 'somebot'].sample}
    flowrate { [1.8, 2.1, 2.5].sample }
  end
end