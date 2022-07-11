require 'rails_helper'

RSpec.describe Types::QueryType do
  before :each do 
    @user = create(:user, username: 'Mike Dao', flowrate: 1.8)
    end_date = DateTime.parse("2022-7-11")
    dates = ((end_date-29)..end_date).map {|d| d.strftime "%Y-%m-%d"}
    dates[0..9].each {|date| FactoryBot.create(:daily_record, user_id: @user.id, date: date, shower_time: 200 )}
    dates[10..19].each {|date| FactoryBot.create(:daily_record, user_id: @user.id, date: date, shower_time: 300 )}
    dates[20..29].each {|date| FactoryBot.create(:daily_record, user_id: @user.id, date: date, shower_time: 400 )}
  end
      
  describe 'display user' do
    it "can query a single user" do
      result = PlanitBeSchema.execute(query).as_json
      expect(result["data"]["getUser"]["username"]).to eq('Mike Dao')
      expect(result["data"]["getUser"]["flowrate"]).to eq(1.8)
    end

    it 'returns weeklyAverageShowerTime' do 
      result = PlanitBeSchema.execute(query).as_json
      avg_time = @user.weekly_average_shower_time("2022-07-11")
      allow(@user).to receive(:weekly_average_shower_time).and_return(avg_time)

      expect(result["data"]["getUser"]["weeklyAverageShowerTime"]).to eq(400.0)

    end

    it 'returns thirtydayAverageShowerTime' do 
      result = PlanitBeSchema.execute(query).as_json
      thirtyday_avg_time = @user.thirtyday_average_shower_time("2022-07-11")
      allow(@user).to receive(:thirtyday_average_shower_time).and_return(thirtyday_avg_time)

      expect(result["data"]["getUser"]["thirtydayAverageShowerTime"]).to eq(300.0)
    end

    it 'returns weeklyAverageWaterUsage' do 
      result = PlanitBeSchema.execute(query).as_json
      avg_time = @user.weekly_average_shower_time("2022-07-11")
      allow(@user).to receive(:weekly_average_shower_time).and_return(avg_time)

      expect(result["data"]["getUser"]["weeklyAverageShowerTime"]).to eq(400.0)
      expect(result["data"]["getUser"]["weeklyAverageWaterUsage"]).to eq(12.0)
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
      }
    }
    GQL
  end
end
