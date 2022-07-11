# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :username, String
    field :flowrate, Float
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :weekly_average_shower_time, Float
    field :thirtyday_average_shower_time, Float

    def weekly_average_shower_time
      object.weekly_average_shower_time
    end

    def thirtyday_average_shower_time
      object.thirtyday_average_shower_time
    end
  end
end
