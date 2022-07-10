require 'rails_helper'
module Mutations
  module Users
    RSpec.describe DeleteUser, type: :request do
      describe '.resolve' do
        it 'deletes a user' do
          create_list(:user, 3)
          create(:user, id: 121)
          users = User.all
          expect(User.count).to eq(4)
          post '/graphql', params: {query: query}
          expect(User.count).to eq(3)
        end
        def query
          <<~GQL
          mutation {
            deleteUser(
              input:{
                id: 121 } ) {
              username
            }
          }
          GQL
        end
      end
    end
  end
end
