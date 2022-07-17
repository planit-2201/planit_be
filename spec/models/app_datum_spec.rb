require 'rails_helper'

RSpec.describe AppDatum, type: :model do
   describe 'instance methods' do
    before :each do
      User.destroy_all
      @users = create_list(:user, 5, flowrate: 2.1)
      end_date = DateTime.parse(Time.now.strftime("%Y-%m-%d"))
      @dates = ((end_date-29)..end_date).map {|d| d.strftime "%Y-%m-%d"}
      @users.each do |user|
        create(:daily_record, user_id: user.id, date: @dates[0], shower_time: 100, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: @dates[1], shower_time: 100, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: @dates[2], shower_time: 100, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: @dates[3], shower_time: 100, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: @dates[4], shower_time: 100, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: @dates[5], shower_time: 100, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: @dates[6], shower_time: 100, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: @dates[7], shower_time: 100, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: @dates[8], shower_time: 100, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: @dates[9], shower_time: 100, bottle_count: 3)
        create(:daily_record, user_id: user.id, date: @dates[10], shower_time: 200, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[11], shower_time: 200, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[12], shower_time: 200, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[14], shower_time: 200, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[14], shower_time: 200, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[15], shower_time: 200, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[16], shower_time: 200, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[17], shower_time: 200, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[18], shower_time: 200, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[19], shower_time: 200, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[20], shower_time: 300, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[21], shower_time: 300, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[22], shower_time: 300, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[23], shower_time: 300, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[24], shower_time: 300, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[25], shower_time: 300, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[26], shower_time: 300, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[27], shower_time: 300, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[28], shower_time: 300, bottle_count: 4)
        create(:daily_record, user_id: user.id, date: @dates[29], shower_time: 300, bottle_count: 4)
        # @dates.each do |date|
        #   create(:daily_record, user_id: user.id, date: date, shower_time: 100, bottle_count: 3)
        #   # create(:daily_record, user_id: user.id, date: date[10..19], shower_time: 200, bottle_count: 4)
        #   # create(:daily_record, user_id: user.id, date: date[20..29], shower_time: 300, bottle_count: 5)
        # end
      end
      @app_datum = AppDatum.create
    end

    it 'returns total number of users' do
      expect(@app_datum.user_count).to eq(5)
    end

    it 'returns 30 day average shower time by user_id across app' do
      expect(@app_datum.thirtyday_average_shower_time).to eq( {@users[0].id=>0.2e3, @users[1].id=>0.2e3, @users[2].id=>0.2e3, @users[3].id=>0.2e3, @users[4].id=>0.2e3})
    end

    it 'returns 30 day average water usage across app' do
      expect(@app_datum.thirtyday_average_water_usage).to eq(7.0)
    end

    it 'returns 30 day average bottle count across app' do
      require "pry"; binding.pry
      expect(@app_datum.thirtyday_average_bottle_count).to eq(7.0)
    end
  end

end
