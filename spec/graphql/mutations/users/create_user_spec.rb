require 'rails_helper'

module Mutations
  module Users
    RSpec.describe CreateUser, type: :request do
      let!(:user) {create(:user, username: "Mike Dao", flowrate: 1.8)}
      describe '.resolve' do
        it "creates a user" do
          count = User.count
          post '/graphql', params: { query: query }
          new_count = count+1
          expect(User.count).to eq(new_count)
        end

        it "returns a user" do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:createUser]
          expect(data[:username]).to eq("Mike Dao")
          expect(data[:flowrate]).to eq(1.8)
        end
      end

      def query
        <<~GQL
        mutation {
          createUser(
          input: {
            username: "Mike Dao"
            flowrate: 1.8
          }
          ) {
            username
            flowrate
            }
          }
        GQL
      end
    end
  end
end
