# frozen_string_literal: true

module Types
  class DailyRecordType < Types::BaseObject
    field :id, ID, null: false
    field :date, String
    field :bag_count, Integer
    field :container_count, Integer
    field :straw_count, Integer
    field :shower_time, Integer
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :user_id, Integer, null: false
  end
end
