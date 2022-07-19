require 'rails_helper'

RSpec.describe Types::QueryType do
  before :each do
    @user = create(:user, username: 'Mike Dao', flowrate: 1.8)
    end_date = DateTime.parse(Time.now.strftime("%Y-%m-%d"))
    dates = ((end_date-29)..end_date).map {|d| d.strftime "%Y-%m-%d"}
    dates[0..9].each {|date| FactoryBot.create(:daily_record, user_id: @user.id, date: date, shower_time: 200, bag_count: 6 )}
    dates[10..19].each {|date| FactoryBot.create(:daily_record, user_id: @user.id, date: date, shower_time: 300, bag_count: 2 )}
    dates[20..29].each {|date| FactoryBot.create(:daily_record, user_id: @user.id, date: date, shower_time: 400, bag_count: 4 )}
    @result = PlanitBeSchema.execute(query).as_json
  end

  describe 'display user' do
    it "can query a single user" do
      expect(@result["data"]["getUser"]["username"]).to eq('Mike Dao')
      expect(@result["data"]["getUser"]["flowrate"]).to eq(1.8)
    end

    it 'returns weeklyAverageShowerTime' do
      expect(@result["data"]["getUser"]["weeklyAverageShowerTime"]).to eq(400.0)

    end

    it 'returns thirtydayAverageShowerTime' do
      expect(@result["data"]["getUser"]["thirtydayAverageShowerTime"]).to eq(300.0)
    end

    it 'returns weeklyAverageWaterUsage' do
      expect(@result["data"]["getUser"]["weeklyAverageShowerTime"]).to eq(400.0)
      expect(@result["data"]["getUser"]["weeklyAverageWaterUsage"]).to eq(12.0)
    end

    it 'returns thirtydayAverageWaterUsage' do
      expect(@result["data"]["getUser"]["thirtydayAverageShowerTime"]).to eq(300.0)
      expect(@result["data"]["getUser"]["thirtydayAverageWaterUsage"]).to eq(9.0)
    end

    it 'returns thirtydayAverageBagUsage' do
      expect(@result["data"]["getUser"]["thirtydayAverageBagUsage"]).to eq(4.0)
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
        thirtydayAverageShowerTime
        weeklyAverageWaterUsage
        thirtydayAverageWaterUsage
        thirtydayAverageBagUsage
      }
    }
    GQL
  end
end
