class AppDatum < ApplicationRecord
  def user_count
  	User.count 
  end

  def thirtyday_average_shower_time(end_date = Time.now.strftime("%Y-%m-%d"))
    range = find_thirtyday_range(end_date)
    DailyRecord.where(date: range).group(:user_id).average(:shower_time)
  end

  def thirtyday_average_water_usage(end_date = Time.now.strftime("%Y-%m-%d"))
    water_usage = thirtyday_average_shower_time.map {|uid, shower_time| User.find(uid).flowrate * shower_time / 60 }
  	(water_usage.inject(0.0) { |sum, el| sum + el } / water_usage.size).to_f.round(2)
  end


  
  private 
  def find_thirtyday_range(date)
    end_date = DateTime.parse(date)
    start_date = end_date-29
    (start_date..end_date).map {|d| d.strftime "%Y-%m-%d"}
  end
end
