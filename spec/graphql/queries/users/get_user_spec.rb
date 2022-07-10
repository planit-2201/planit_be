require 'rails_helper'

RSpec.describe Types::QueryType do
  describe 'display user' do
    it "can query a single user" do
      create(:user, id: 1, username: 'Mike Dao', flowrate: 1.8)

      result = PlanitBeSchema.execute(query).as_json
      expect(result["data"]["getUser"]["username"]).to eq('Mike Dao')
      expect(result["data"]["getUser"]["flowrate"]).to eq(1.8)
    end
  end

  def query
    <<~GQL
    {
      getUser(id: "1")
      {
        username
        flowrate
      }
    }
    GQL
  end
end