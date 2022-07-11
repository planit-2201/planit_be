module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me

    field :get_user, Types::UserType, null: false, description: 'Returns a single user by id' do
      argument :id, ID, required: true
    end

    def get_user(id:)
      User.find(id)
    end

    field :get_user_daily_records, [Types::DailyRecordType], null: false, description: 'Returns a single user daily_records by id' do
      argument :user_id, ID, required: true
    end


    def get_user_daily_records(user_id:)
      DailyRecord.where('user_id = ?', user_id)
    end

    field :get_user_daily_record, [Types::DailyRecordType], null: false, description: 'Returns a single user daily_record on a specific day' do
      argument :user_id, ID, required: true
      argument :date, String, required: true
    end


    def get_user_daily_record(user_id:, date:)
      DailyRecord.where('user_id = ? AND date=?', user_id, date)
    end

  end
end
