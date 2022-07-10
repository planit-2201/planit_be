require 'rails_helper'
module Mutations
  module Users
    RSpec.describe DeleteUser, type: :request do
      describe '.resolve' do
        it 'deletes a user' do
          create_list(:user, 3)
          create(:user, id: 121)
          users = User.all
          count = User.count
          expect(User.count).to eq(count)
          post '/graphql', params: {query: query}
          new_count = count-1
          expect(User.count).to eq(new_count)
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
