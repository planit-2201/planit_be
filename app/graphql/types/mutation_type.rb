module Types
  class MutationType < Types::BaseObject
    # TODO: remove me
    field :create_daily_record, mutation: Mutations::DailyRecords::CreateDailyRecord
    field :update_daily_record, mutation: Mutations::DailyRecords::UpdateDailyRecord
    field :create_user, mutation: Mutations::Users::CreateUser
    field :update_user, mutation: Mutations::Users::UpdateUser
  end
end
