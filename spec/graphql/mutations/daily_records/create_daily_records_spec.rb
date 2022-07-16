require 'rails_helper'

module Mutations
  module DailyRecords
    RSpec.describe CreateDailyRecord, type: :request do
      let!(:user) {create(:user, username: "Mike Dao", flowrate: 1.8)}
      describe '.resolve' do
        it "creates a daily record" do
          count = DailyRecord.count
          post '/graphql', params: { query: query }
          new_count = count+1
          expect(DailyRecord.count).to eq(new_count)
        end

        it "returns a daily record" do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:createDailyRecord]
          expect(data[:date]).to eq("2202-07-09")
          expect(data[:bagCount]).to eq(3)
          expect(data[:bottleCount]).to eq(1)
          expect(data[:strawCount]).to eq(0)
          expect(data[:showerTime]).to eq(500)
        end
      end

      def query
        <<~GQL
        mutation {
          createDailyRecord(
          input: {
            date: "2202-07-09"
            userId: #{User.last.id}
            bagCount: 3
            bottleCount: 1
            strawCount: 0
            showerTime: 500
          }
          ) {
            date
            userId
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
