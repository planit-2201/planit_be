require 'rails_helper'

module Mutations
  module DailyRecords
    RSpec.describe CreateDailyRecord, type: :request do
      describe '.resolve' do
        xit "creates a daily record" do
          expect(DailyRecords.count).to eq(0)
          post '/graphql', params: { query: query }
          expect(DailyRecords.count).to eq(1)
        end

        it "returns a daily record" do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body, symbolize_names: true)
          data = json['data']
          require "pry"; binding.pry
          expect(data['daily_records']['date']).to eq("2202-07-09")
          expect(data['daily_records']['bag_count']).to eq(3)
          expect(data['daily_records']['container_count']).to eq(1)
          expect(data['daily_records']['straw_count']).to eq(0)
          expect(data['daily_records']['shower_time']).to eq(500)
        end
      end

      def query
        <<~GQL
        mutation {
          createDailyRecord(
          input: {
            date: "2202-07-09"
            bag_count: 3
            container_count: 1
            straw_count: 0
            shower_time: 500
          }
          ) {
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
  end
end
