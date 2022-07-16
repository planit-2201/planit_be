require 'rails_helper'
module Mutations
  module Users
    RSpec.describe DeleteUser, type: :request do
      describe '.resolve' do
        before :each do 
          create_list(:user, 3)
          @user = User.last 
        end
        it 'deletes a user' do
          # users = User.all
          count = User.count
          expect(User.count).to eq(count)
          post '/graphql', params: {query: query}
          new_count = count-1
          expect(User.count).to eq(new_count)
          find_user = User.where(id: @user.id)
          expect(find_user).to eq([])
        end
        def query
          <<~GQL
          mutation {
            deleteUser(
              input:{
                id: #{@user.id} } ) {
              username
            }
          }
          GQL
        end
      end
    end
  end
end
