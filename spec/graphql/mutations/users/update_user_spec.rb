require 'rails_helper'

module Mutations
  module Users
    RSpec.describe UpdateUser, type: :request do
      let!(:user) {create(:user, username: "Mike Dao", flowrate: 1.8)}
      describe '.resolve' do

        it "updates a user" do
          post '/graphql', params: { query: query }
          json = JSON.parse(response.body, symbolize_names: true)
          data = json[:data][:updateUser]

          updated_user = User.find(user.id)

          expect(updated_user.username).to eq("Scott")
          expect(updated_user.flowrate).to eq(2.2)
        end
      end

      def query
        <<~GQL
        mutation {
          updateUser(
          input: {
            id: #{user.id}
            username: "Scott"
            flowrate: 2.2
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
