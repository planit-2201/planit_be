module Mutations
  module DailyRecords
    class CreateDailyRecord < ::Mutations::BaseMutation
      argument :user_id, Integer, required: true
      argument :date, String, required: true
      argument :shower_time, Integer
      argument :bag_count, Integer
      argument :straw_count, Integer
      argument :container_count, Integer
      type Types::DailyRecordType

      def resolve(attributes)
        user_id = attributes[:user_id]
        user = User.find(user_id)
        DailyRecord.create(attributes)
      end
    end
  end
end