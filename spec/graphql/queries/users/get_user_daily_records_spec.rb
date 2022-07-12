require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display user daily records' do
    it "can query a user daily records" do
      user = create(:user, username: "Mike Dao", flowrate: 1.8)

      user.daily_records.create(date: "2022-07-09", bag_count: 3, container_count: 4, straw_count: 6, shower_time: 0)
      user.daily_records.create(date: "2022-07-10", bag_count: 5, container_count: 0, straw_count: 0, shower_time: 100)
      
      result = PlanitBeSchema.execute(query).as_json
      expect(result['data']['getUserDailyRecords'].count).to eq(2)
      expect(result['data']['getUserDailyRecords'][0]['date']).to eq("2022-07-09")
      expect(result['data']['getUserDailyRecords'][0]['bagCount']).to eq(3)
      expect(result['data']['getUserDailyRecords'][0]['containerCount']).to eq(4)
      expect(result['data']['getUserDailyRecords'][0]['strawCount']).to eq(6)
      expect(result['data']['getUserDailyRecords'][0]['showerTime']).to eq(0)
    end
  end

  def query
    <<~GQL
    { getUserDailyRecords(userId: #{User.last.id})
      {
        date
        bagCount
        containerCount
        strawCount
        showerTime
      }
     }
    GQL
  end
end
