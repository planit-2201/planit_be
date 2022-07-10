class User < ApplicationRecord
  validates_presence_of :username, :flowrate
  validates_numericality_of :flowrate
  has_many :daily_records, foreign_key: :user_id, dependent: :destroy

  def weekly_average_shower_time(end_date = Time.now.strftime("%Y-%m-%d"))
    range = find_weekly_range(end_date)
    daily_records.where(date: range).average(:shower_time)
  end

  private

  def find_weekly_range(date)
    end_date = DateTime.parse(date)
    start_date = end_date-6
    range = start_date..end_date
    range.map {|d| d.strftime "%Y-%m-%d"}
  end
end
