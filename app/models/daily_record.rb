class DailyRecord < ApplicationRecord
  validates_presence_of :date, :bag_count, :container_count, :straw_count, :shower_time

  validates_numericality_of :bag_count, :container_count, :straw_count, :shower_time

  belongs_to :user
end
