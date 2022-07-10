module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_daily_record, mutation: Mutations::DailyRecords::CreateDailyRecord
    field :create_user, mutation: Mutations::Users::CreateUser
  end
end
