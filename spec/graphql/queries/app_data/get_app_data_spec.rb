require 'rails_helper'

RSpec.describe Types::QueryType do
  before :each do
    app_datum = AppDatum.create
    @users = create_list(:user, 5, flowrate: 2.1)
    end_date = DateTime.parse(Time.now.strftime("%Y-%m-%d"))
    dates = ((end_date-29)..end_date).map {|d| d.strftime "%Y-%m-%d"}
    @users.each do |user|
      create(:daily_record, user_id: user.id, date: dates[0], shower_time: 100)
      create(:daily_record, user_id: user.id, date: dates[10], shower_time: 200)
      create(:daily_record, user_id: user.id, date: dates[20], shower_time: 300)
    end
    @count = app_datum.user_count 
    @water_usage = app_datum.thirtyday_average_water_usage
    @result = PlanitBeSchema.execute(query).as_json
  end
  it 'returns total number of users' do
    expect(@result["data"]["getAppData"]["userCount"]).to eq(@count)
  end

  it 'returns 30 day average water usage' do
    expect(@result["data"]["getAppData"]["thirtydayAverageWaterUsage"]).to eq(@water_usage)
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
