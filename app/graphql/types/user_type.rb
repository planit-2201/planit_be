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
    field :weekly_average_water_usage, Float
    field :thirtyday_average_water_usage, Float
    field :thirtyday_average_bottle_count, Float


    def weekly_average_shower_time
      object.weekly_average_shower_time
    end

    def thirtyday_average_shower_time
      object.thirtyday_average_shower_time
    end

    def weekly_average_water_usage
      object.weekly_average_water_usage
    end

    def thirtyday_average_water_usage
      object.thirtyday_average_water_usage
    end

    def thirtyday_average_bottle_count
      object.thirtyday_average_bottle_count
    end
  end
end
