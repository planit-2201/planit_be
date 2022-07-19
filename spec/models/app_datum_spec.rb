require 'rails_helper'

RSpec.describe AppDatum, type: :model do
   describe 'instance methods' do
    before :each do
      User.destroy_all
      @users = create_list(:user, 5, flowrate: 2.1)
      end_date = DateTime.parse(Time.now.strftime("%Y-%m-%d"))
      dates = ((end_date-29)..end_date).map {|d| d.strftime "%Y-%m-%d"}
      @users.each do |user|
        create(:daily_record, user_id: user.id, date: dates[0], shower_time: 100, straw_count: 1, bag_count: 6, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: dates[10], shower_time: 200, straw_count: 3, bag_count: 2, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: dates[20], shower_time: 300, straw_count: 5, bag_count: 4, bottle_count: 5)
      end
      @app_datum = AppDatum.create
    end
    
    it 'returns total number of users' do
      expect(@app_datum.user_count).to eq(5)
    end

    it 'returns 30 day average shower time by user_id across app' do
      expect(@app_datum.thirtyday_average_shower_time).to eq( {@users[0].id=>0.2e3, @users[1].id=>0.2e3, @users[2].id=>0.2e3, @users[3].id=>0.2e3, @users[4].id=>0.2e3})
    end

    it 'returns 30 day average bottle count across app' do
      expect(@app_datum.thirtyday_average_bottle_count).to eq(4.0)
    end
    
    it 'returns 30 day average water usage across app' do 
      expect(@app_datum.thirtyday_average_water_usage).to eq(7.0)
    end

    it 'returns 30 day average straw count usage across app' do
      expect(@app_datum.thirtyday_average_straw_count).to eq(3.0) 
    end    
    
    it 'returns 30 day average bag count across app' do
      expect(@app_datum.thirtyday_average_bag_count).to eq(4.0)
    end
  end
end
