class DailyRecord < ApplicationRecord
  validates_presence_of :date, :bag_count, :bottle_count, :straw_count, :shower_time

  validates_numericality_of :bag_count, :bottle_count, :straw_count, :shower_time

  belongs_to :user

  def self.users_no_previous_day_record
    User.pluck(:id) -  DailyRecord.where('date =?', previous_day).pluck(:user_id)
  end

  def self.generate_previous_day_records
    user_ids = users_no_previous_day_record
    user_ids.each {|user_id| DailyRecord.create!(user_id: user_id, date: previous_day)}
  end


  private 
  def previous_day
    today = DateTime.parse(Time.now.strftime("%Y-%m-%d"))
    (today - 1).strftime("%Y-%m-%d")
  end
end
