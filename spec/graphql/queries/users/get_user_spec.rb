require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display user' do
    it "can query a single user" do
      user = create(:user, username: 'Mike Dao', flowrate: 1.8)

      user.daily_records.create(date: "2022-07-04", shower_time: 300)
      user.daily_records.create(date: "2022-07-05", shower_time: 400)
      user.daily_records.create(date: "2022-07-06", shower_time: 300)
      user.daily_records.create(date: "2022-07-07", shower_time: 200)
      user.daily_records.create(date: "2022-07-08", shower_time: 200)
      user.daily_records.create(date: "2022-07-09", shower_time: 200)
      user.daily_records.create(date: "2022-07-10", shower_time: 200)
      avg_time = user.weekly_average_shower_time("2022-07-11")
      allow(user).to receive(:weekly_average_shower_time).and_return(avg_time)

      result = PlanitBeSchema.execute(query).as_json
      expect(result["data"]["getUser"]["username"]).to eq('Mike Dao')
      expect(result["data"]["getUser"]["flowrate"]).to eq(1.8)
      expect(result["data"]["getUser"]["weeklyAverageShowerTime"]).to eq(250.0)
      expect(result["data"]["getUser"]["weeklyAverageWaterUsage"]).to eq(54)
    end
  end

# sum shower time from the previous 7 days - 1,800 seconds, 30 minutes
# convert sum to minutes - 30 minutes
# multiply flow rate (gallons/ per minute) by minutes - 30 minutes
# return product of fr x min as a float - 54 gallons

  def query
    <<~GQL
    {
      getUser(id: #{User.last.id})
      {
        username
        flowrate
        weeklyAverageShowerTime
      }
    }
    GQL
  end
end
