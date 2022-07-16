# frozen_string_literal: true

module Types
  class AppDataType < Types::BaseObject
    field :user_count, Integer
    field :thirtyday_average_water_usage, Float
    field :thirtyday_average_bag_count, Float
    field :thirtyday_average_straw_count, Float
    field :thirtyday_average_bottle_count, Float
  end
end
