require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display user daily record' do
    it "can query a user daily record" do
      user = create(:user, username: "Mike Dao", flowrate: 1.8)

      user.daily_records.create(date: "2022-07-09", bag_count: 3, bottle_count: 4, straw_count: 6, shower_time: 0)
      user.daily_records.create(date: "2022-07-10", bag_count: 5, bottle_count: 0, straw_count: 0, shower_time: 100)
      result = PlanitBeSchema.execute(query).as_json

      expect(result['data']['getUserDailyRecord'].count).to eq(1)
      expect(result['data']['getUserDailyRecord'][0]['date']).to eq("2022-07-09")
      expect(result['data']['getUserDailyRecord'][0]['bagCount']).to eq(3)
      expect(result['data']['getUserDailyRecord'][0]['bottleCount']).to eq(4)
      expect(result['data']['getUserDailyRecord'][0]['strawCount']).to eq(6)
      expect(result['data']['getUserDailyRecord'][0]['showerTime']).to eq(0)
    end
  end

  def query
    <<~GQL
    query {
        getUserDailyRecord(userId: #{User.last.id}, date: "2022-07-09") {
         date
         bagCount
         bottleCount
         strawCount
         userId
         showerTime
        }
      }
    GQL
  end
end
