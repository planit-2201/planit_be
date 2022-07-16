require 'rails_helper'

RSpec.describe AppDatum, type: :model do
   describe 'instance methods' do
    before :each do
      users = create_list(:user, 10, flowrate: 2.1)
      end_date = DateTime.parse(Time.now.strftime("%Y-%m-%d"))
      dates = ((end_date-29)..end_date).map {|d| d.strftime "%Y-%m-%d"}
      users.each do |user|
        create(:daily_record, user_id: user.id, date: dates[0], shower_time: 100)
        create(:daily_record, user_id: user.id, date: dates[10], shower_time: 200)
        create(:daily_record, user_id: user.id, date: dates[20], shower_time: 300)
      end
      @result = PlanitBeSchema.execute(query).as_json
    end
    it 'returns total number of users' do
      expect(@result["data"]["getAppData"]["userCount"]).to eq(10)
    end

    it 'returns 30 day average water usage' do
      expect(@result["data"]["getAppData"]["thirtydayAverageWaterUsage"]).to eq(7.0)
    end
  end

  def query
    <<~GQL
    {
      getAppData
      {
        userCount
        thirtydayAverageWaterUsage
      }
    }
    GQL
  end
end
