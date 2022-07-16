module Mutations
  module DailyRecords
    class UpdateDailyRecord < ::Mutations::BaseMutation
      argument :user_id, Integer, required: true
      argument :date, String, required: true
      argument :shower_time, Integer, required: true
      argument :bag_count, Integer, required: true
      argument :straw_count, Integer, required: true
      argument :bottle_count, Integer, required: true
      
      type Types::DailyRecordType

      def resolve(attributes)
        user_id = attributes[:user_id]
        user = User.find(user_id)
        user.daily_records.update(attributes).first
      end
    end
  end
end