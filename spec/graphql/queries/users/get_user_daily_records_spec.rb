require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display user daily records' do
    it "can query a user daily records" do
      user = create(:user, id: 1, username: "Mike Dao", flowrate: 1.8)

      user.daily_records.create(:daily_records, date: "2022-07-09", bag_count: 3, container_count: 4, straw_count: 6, shower_time: 0)
      result = PlanitBeSchema.execute(query).as_json

      expect(result['data']['getUserDailyRecords']['date']).to eq("2022-07-09")
      expect(result['data']['getUserDailyRecords']['bag_count']).to eq(3)
      expect(result['data']['getUserDailyRecords']['container_count']).to eq(4)
      expect(result['data']['getUserDailyRecords']['straw_count']).to eq(6)
      expect(result['data']['getUserDailyRecords']['shower_time']).to eq(0)
    end
  end

  def query
    <<~GQL
    { getUserDailyRecords(id: "1")
      {
        date
        bag_count
        container_count
        straw_count
        shower_time
      }
     }
    GQL
  end
end
