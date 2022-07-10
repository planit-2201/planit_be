class User < ApplicationRecord
  validates_presence_of :username, :flowrate

  validates_numericality_of :flowrate

  has_many :daily_records, foreign_key: :user_id, dependent: :destroy

  def weekly_average_shower_time(date)
    range = find_weekly_range(date)
    DailyRecord.where(:date => range)
  end

  private

  def find_weekly_range(date)
    end_date = DateTime.parse(date)
    start_date = end_date-6
    range = start_date..end_date
    range.map {|d| d.strftime "%m-%d-%Y"}
  end
end
