require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display user' do
    it "can query a single user" do
      user = create(:user, username: 'Mike Dao', flowrate: 1.8)

      user.daily_records.create(date: "2022-07-05", shower_time: 300)
      user.daily_records.create(date: "2022-07-06", shower_time: 400)
      user.daily_records.create(date: "2022-07-07", shower_time: 300)
      user.daily_records.create(date: "2022-07-08", shower_time: 200)
      user.daily_records.create(date: "2022-07-09", shower_time: 200)
      user.daily_records.create(date: "2022-07-10", shower_time: 200)
      user.daily_records.create(date: "2022-07-11", shower_time: 200)

      avg_time = user.weekly_average_shower_time("2022-07-11")
      avg_water = user.weekly_average_water_usage("2022-07-11")
      allow(user).to receive(:weekly_average_shower_time).and_return(avg_time)
      allow(user).to receive(:weekly_average_water_usage).and_return(avg_water)

      result = PlanitBeSchema.execute(query).as_json
      
      expect(result["data"]["getUser"]["username"]).to eq('Mike Dao')
      expect(result["data"]["getUser"]["flowrate"]).to eq(1.8)
      expect(result["data"]["getUser"]["weeklyAverageShowerTime"]).to eq(257.14285714285717)
      expect(result["data"]["getUser"]["weeklyAverageWaterUsage"]).to eq(54)
    end
  end

  def query
    <<~GQL
    {
      getUser(id: #{User.last.id})
      {
        username
        flowrate
        weeklyAverageShowerTime
        weeklyAverageWaterUsage
      }
    }
    GQL
  end
end
