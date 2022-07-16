require 'rails_helper'

module Mutations
  module DailyRecords
    RSpec.describe UpdateDailyRecord, type: :request do
      let!(:user) {create(:user, username: "Mike Dao", flowrate: 1.8)}
      
      describe '.resolve' do
        
        it "updates a daily record" do
          user.daily_records.create!(date: "2022-07-10", bag_count: 1, bottle_count: 2, straw_count: 3, shower_time: 500)
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:updateDailyRecord]

          updated_daily_record = User.find(user.id).daily_records[0]

          expect(updated_daily_record.date).to eq("2022-07-09")
          expect(updated_daily_record.bag_count).to eq(2)
          expect(updated_daily_record.bottle_count).to eq(3)
          expect(updated_daily_record.straw_count).to eq(4)
          expect(updated_daily_record.shower_time).to eq(700)
        end
      end

      def query
        <<~GQL
        mutation {
          updateDailyRecord(
          input: {
            userId: #{user.id}
            date: "2022-07-09"
            bagCount: 2
            bottleCount: 3
            strawCount: 4
            showerTime: 700
          }
          ) {
            userId
            date
            bagCount
            bottleCount
            strawCount
            showerTime
            }
          }
        GQL
      end
    end
  end
end