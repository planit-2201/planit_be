class User < ApplicationRecord
  validates_presence_of :username, :flowrate
  validates_numericality_of :flowrate
  has_many :daily_records, foreign_key: :user_id, dependent: :destroy

  def weekly_average_shower_time(end_date = Time.now.strftime("%Y-%m-%d"))
    range = find_weekly_range(end_date)
    daily_records.where(date: range).average(:shower_time).round
  end

  def thirtyday_average_shower_time(end_date = Time.now.strftime("%Y-%m-%d"))
    range = find_thirtyday_range(end_date)
    (daily_records.where(date: range).average(:shower_time)).round
  end

  def weekly_average_water_usage(end_date = Time.now.strftime("%Y-%m-%d"))
    minutes = weekly_average_shower_time(end_date).to_f/60
    (flowrate * minutes.to_f).round(2)
  end

  def thirtyday_average_water_usage(end_date = Time.now.strftime("%Y-%m-%d"))
    minutes = thirtyday_average_shower_time(end_date).to_f/60
    (flowrate * minutes.to_f).round(2)
  end

  def thirtyday_average_bag_count(end_date = Time.now.strftime("%Y-%m-%d"))
    range = find_thirtyday_range(end_date)
    (daily_records.where(date: range).average(:bag_count)).to_f.round
  end

  def thirtyday_average_bag_usage(end_date = Time.now.strftime("%Y-%m-%d"))
    range = find_thirtyday_range(end_date)
    (daily_records.where(date: range).average(:bag_count)).to_f.round
  end

  private

  def find_weekly_range(date)
    end_date = DateTime.parse(date)
    start_date = end_date-6
    (start_date..end_date).map {|d| d.strftime "%Y-%m-%d"}
  end

  def find_thirtyday_range(date)
    end_date = DateTime.parse(date)
    start_date = end_date-29
    (start_date..end_date).map {|d| d.strftime "%Y-%m-%d"}
  end
end
