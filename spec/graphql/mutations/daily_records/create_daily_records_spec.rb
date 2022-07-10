require 'rails_helper'

module Mutations
  module DailyRecords
    RSpec.describe CreateDailyRecord, type: :request do
      describe '.resolve' do
        xit "creates a daily record" do
          create(:user, id: 1, username: "Mike Dao", flowrate: 1.8)
          expect(DailyRecords.count).to eq(0)
          post '/graphql', params: { query: query }
          expect(DailyRecords.count).to eq(1)
        end

        it "returns a daily record" do
          create(:user, id: 1, username: "Mike Dao", flowrate: 1.8)
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:createDailyRecord]
          expect(data[:date]).to eq("2202-07-09")
          expect(data[:bagCount]).to eq(3)
          expect(data[:containerCount]).to eq(1)
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
            userId: 1
            bagCount: 3
            containerCount: 1
            strawCount: 0
            showerTime: 500
          }
          ) {
            date
            userId
            bagCount
            containerCount
            strawCount
            showerTime
            }
          }
        GQL
      end
    end
  end
end
