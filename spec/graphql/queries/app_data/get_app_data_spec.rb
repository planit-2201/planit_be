require 'rails_helper'

RSpec.describe Types::QueryType do
  before :each do
    User.destroy_all
    users = create_list(:user, 5, flowrate: 2.1)
    end_date = DateTime.parse(Time.now.strftime("%Y-%m-%d"))
    dates = ((end_date-29)..end_date).map {|d| d.strftime "%Y-%m-%d"}
    users.each do |user|
      create(:daily_record, user_id: user.id, date: dates[0], shower_time: 100, bag_count: 9)
      create(:daily_record, user_id: user.id, date: dates[10], shower_time: 200, bag_count: 3)
      create(:daily_record, user_id: user.id, date: dates[20], shower_time: 300, bag_count: 6)
    end
    @result = PlanitBeSchema.execute(query).as_json
  end
  it 'returns total number of users' do
    expect(@result["data"]["getAppData"]["userCount"]).to eq(5)
  end

  it 'returns 30 day average water usage' do
    expect(@result["data"]["getAppData"]["thirtydayAverageWaterUsage"]).to eq(7.0)
  end

  it 'returns 30 day average bag count' do
    expect(@result["data"]["getAppData"]["thirtydayAverageBagCount"]).to eq(6.0)
  end

  def query
    <<~GQL
    {
      getAppData
      {
        userCount
        thirtydayAverageWaterUsage
        thirtydayAverageBagCount
      }
    }
    GQL
  end
end
