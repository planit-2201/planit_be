require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of :username }
    it { should validate_presence_of :flowrate }
    it { should validate_numericality_of :flowrate }
  end

  describe 'relationships' do
    it { should have_many :daily_records }
  end

  describe 'instance methods' do
    it '.returns weekly average shower time for a user' do
      user = create(:user, username: "Mike Dao", flowrate: 1.8)
      user.daily_records.create(date: "2022-07-04", shower_time: 300)
      user.daily_records.create(date: "2022-07-05", shower_time: 400)
      user.daily_records.create(date: "2022-07-06", shower_time: 100)
      user.daily_records.create(date: "2022-07-07", shower_time: 200)
      user.daily_records.create(date: "2022-07-08", shower_time: 500)
      user.daily_records.create(date: "2022-07-09", shower_time: 430)
      user.daily_records.create(date: "2022-07-03", shower_time: 380)
      user.daily_records.create(date: "2022-07-10", shower_time: 100000)

      expect(user.weekly_average_shower_time("2022-07-09")).to eq(330)
    end

    it '.returns weekly average water usage' do
      user = create(:user, username: "Mike Dao", flowrate: 1.8)
      user.daily_records.create(date: "2022-07-05", shower_time: 300)
      user.daily_records.create(date: "2022-07-06", shower_time: 400)
      user.daily_records.create(date: "2022-07-07", shower_time: 300)
      user.daily_records.create(date: "2022-07-08", shower_time: 200)
      user.daily_records.create(date: "2022-07-09", shower_time: 200)
      user.daily_records.create(date: "2022-07-10", shower_time: 200)
      user.daily_records.create(date: "2022-07-11", shower_time: 200)

      expect(user.weekly_average_water_usage).to eq(54)
    end
  end
end