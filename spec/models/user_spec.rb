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

    it '.returns 30 day average shower time for a user' do
      user = create(:user, username: "Mike Dao", flowrate: 1.8)
      user.daily_records.create(date: "2022-07-01", shower_time: 300)
      user.daily_records.create(date: "2022-07-02", shower_time: 400)
      user.daily_records.create(date: "2022-07-03", shower_time: 100)
      user.daily_records.create(date: "2022-07-04", shower_time: 200)
      user.daily_records.create(date: "2022-07-05", shower_time: 500)
      user.daily_records.create(date: "2022-07-06", shower_time: 430)
      user.daily_records.create(date: "2022-07-07", shower_time: 380)
      user.daily_records.create(date: "2022-07-08", shower_time: 540)
      user.daily_records.create(date: "2022-07-09", shower_time: 300)
      user.daily_records.create(date: "2022-07-10", shower_time: 400)
      user.daily_records.create(date: "2022-07-11", shower_time: 100)
      user.daily_records.create(date: "2022-06-12", shower_time: 200)
      user.daily_records.create(date: "2022-06-13", shower_time: 500)
      user.daily_records.create(date: "2022-06-14", shower_time: 430)
      user.daily_records.create(date: "2022-06-15", shower_time: 380)
      user.daily_records.create(date: "2022-06-16", shower_time: 380)
      user.daily_records.create(date: "2022-06-17", shower_time: 300)
      user.daily_records.create(date: "2022-06-18", shower_time: 400)
      user.daily_records.create(date: "2022-06-19", shower_time: 100)
      user.daily_records.create(date: "2022-06-20", shower_time: 200)
      user.daily_records.create(date: "2022-06-21", shower_time: 500)
      user.daily_records.create(date: "2022-06-22", shower_time: 430)
      user.daily_records.create(date: "2022-06-23", shower_time: 380)
      user.daily_records.create(date: "2022-06-24", shower_time: 520)
      user.daily_records.create(date: "2022-06-25", shower_time: 650)
      user.daily_records.create(date: "2022-06-26", shower_time: 300)
      user.daily_records.create(date: "2022-06-27", shower_time: 400)
      user.daily_records.create(date: "2022-06-28", shower_time: 100)
      user.daily_records.create(date: "2022-06-29", shower_time: 200)
      user.daily_records.create(date: "2022-06-30", shower_time: 500)
      user.daily_records.create(date: "2022-06-11", shower_time: 100000)

      expect(user.thirtyday_average_shower_time("2022-07-11")).to eq(351)
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

      expect(user.weekly_average_water_usage("2022-07-11")).to eq(7.71)
    end

    it '.returns 30 day average water usage' do
      user = create(:user, username: "Mike Dao", flowrate: 1.8)
      user.daily_records.create(date: "2022-07-01", shower_time: 300)
      user.daily_records.create(date: "2022-07-02", shower_time: 400)
      user.daily_records.create(date: "2022-07-03", shower_time: 100)
      user.daily_records.create(date: "2022-07-04", shower_time: 200)
      user.daily_records.create(date: "2022-07-05", shower_time: 500)
      user.daily_records.create(date: "2022-07-06", shower_time: 430)
      user.daily_records.create(date: "2022-07-07", shower_time: 380)
      user.daily_records.create(date: "2022-07-08", shower_time: 540)
      user.daily_records.create(date: "2022-07-09", shower_time: 300)
      user.daily_records.create(date: "2022-07-10", shower_time: 400)
      user.daily_records.create(date: "2022-07-11", shower_time: 100)
      user.daily_records.create(date: "2022-06-12", shower_time: 200)
      user.daily_records.create(date: "2022-06-13", shower_time: 500)
      user.daily_records.create(date: "2022-06-14", shower_time: 430)
      user.daily_records.create(date: "2022-06-15", shower_time: 380)
      user.daily_records.create(date: "2022-06-16", shower_time: 380)
      user.daily_records.create(date: "2022-06-17", shower_time: 300)
      user.daily_records.create(date: "2022-06-18", shower_time: 400)
      user.daily_records.create(date: "2022-06-19", shower_time: 100)
      user.daily_records.create(date: "2022-06-20", shower_time: 200)
      user.daily_records.create(date: "2022-06-21", shower_time: 500)
      user.daily_records.create(date: "2022-06-22", shower_time: 430)
      user.daily_records.create(date: "2022-06-23", shower_time: 380)
      user.daily_records.create(date: "2022-06-24", shower_time: 520)
      user.daily_records.create(date: "2022-06-25", shower_time: 650)
      user.daily_records.create(date: "2022-06-26", shower_time: 300)
      user.daily_records.create(date: "2022-06-27", shower_time: 400)
      user.daily_records.create(date: "2022-06-28", shower_time: 100)
      user.daily_records.create(date: "2022-06-29", shower_time: 200)
      user.daily_records.create(date: "2022-06-30", shower_time: 500)
      user.daily_records.create(date: "2022-06-11", shower_time: 100000)

      expect(user.thirtyday_average_water_usage("2022-07-11")).to eq(10.53)
    end

    it '.returns 30 day average bottle count' do
      user = create(:user, username: "Mike Dao", flowrate: 1.8)
      user.daily_records.create(date: "2022-07-01", bottle_count: 3)
      user.daily_records.create(date: "2022-07-02", bottle_count: 4)
      user.daily_records.create(date: "2022-07-03", bottle_count: 1)
      user.daily_records.create(date: "2022-07-04", bottle_count: 2)
      user.daily_records.create(date: "2022-07-05", bottle_count: 5)
      user.daily_records.create(date: "2022-07-06", bottle_count: 4)
      user.daily_records.create(date: "2022-07-07", bottle_count: 3)
      user.daily_records.create(date: "2022-07-08", bottle_count: 5)
      user.daily_records.create(date: "2022-07-09", bottle_count: 3)
      user.daily_records.create(date: "2022-07-10", bottle_count: 4)
      user.daily_records.create(date: "2022-07-11", bottle_count: 1)
      user.daily_records.create(date: "2022-06-12", bottle_count: 2)
      user.daily_records.create(date: "2022-06-13", bottle_count: 5)
      user.daily_records.create(date: "2022-06-14", bottle_count: 4)
      user.daily_records.create(date: "2022-06-15", bottle_count: 3)
      user.daily_records.create(date: "2022-06-16", bottle_count: 3)
      user.daily_records.create(date: "2022-06-17", bottle_count: 3)
      user.daily_records.create(date: "2022-06-18", bottle_count: 4)
      user.daily_records.create(date: "2022-06-19", bottle_count: 1)
      user.daily_records.create(date: "2022-06-20", bottle_count: 2)
      user.daily_records.create(date: "2022-06-21", bottle_count: 5)
      user.daily_records.create(date: "2022-06-22", bottle_count: 4)
      user.daily_records.create(date: "2022-06-23", bottle_count: 3)
      user.daily_records.create(date: "2022-06-24", bottle_count: 5)
      user.daily_records.create(date: "2022-06-25", bottle_count: 6)
      user.daily_records.create(date: "2022-06-26", bottle_count: 3)
      user.daily_records.create(date: "2022-06-27", bottle_count: 4)
      user.daily_records.create(date: "2022-06-28", bottle_count: 1)
      user.daily_records.create(date: "2022-06-29", bottle_count: 2)
      user.daily_records.create(date: "2022-06-30", bottle_count: 5)
      user.daily_records.create(date: "2022-06-11", bottle_count: 1000)

      expect(user.thirtyday_average_bottle_count("2022-07-11")).to eq(3)

    it '.returns 30 day average bag count' do
      user = create(:user, username: "Mike Dao", flowrate: 1.8)
      user.daily_records.create(date: "2022-07-01", bag_count: 33)
      user.daily_records.create(date: "2022-07-02", bag_count: 4)
      user.daily_records.create(date: "2022-07-03", bag_count: 1)
      user.daily_records.create(date: "2022-07-04", bag_count: 2)
      user.daily_records.create(date: "2022-07-05", bag_count: 5)
      user.daily_records.create(date: "2022-07-06", bag_count: 4)
      user.daily_records.create(date: "2022-07-07", bag_count: 3)
      user.daily_records.create(date: "2022-07-08", bag_count: 5)
      user.daily_records.create(date: "2022-07-09", bag_count: 3)
      user.daily_records.create(date: "2022-07-10", bag_count: 4)
      user.daily_records.create(date: "2022-07-11", bag_count: 1)
      user.daily_records.create(date: "2022-06-12", bag_count: 2)
      user.daily_records.create(date: "2022-06-13", bag_count: 5)
      user.daily_records.create(date: "2022-06-14", bag_count: 4)
      user.daily_records.create(date: "2022-06-15", bag_count: 3)
      user.daily_records.create(date: "2022-06-16", bag_count: 3)
      user.daily_records.create(date: "2022-06-17", bag_count: 3)
      user.daily_records.create(date: "2022-06-18", bag_count: 4)
      user.daily_records.create(date: "2022-06-19", bag_count: 1)
      user.daily_records.create(date: "2022-06-20", bag_count: 2)
      user.daily_records.create(date: "2022-06-21", bag_count: 5)
      user.daily_records.create(date: "2022-06-22", bag_count: 4)
      user.daily_records.create(date: "2022-06-23", bag_count: 3)
      user.daily_records.create(date: "2022-06-24", bag_count: 5)
      user.daily_records.create(date: "2022-06-25", bag_count: 6)
      user.daily_records.create(date: "2022-06-26", bag_count: 3)
      user.daily_records.create(date: "2022-06-27", bag_count: 4)
      user.daily_records.create(date: "2022-06-28", bag_count: 1)
      user.daily_records.create(date: "2022-06-29", bag_count: 2)
      user.daily_records.create(date: "2022-06-30", bag_count: 5)
      user.daily_records.create(date: "2022-06-11", bag_count: 100000)

      expect(user.thirtyday_average_bag_count("2022-07-11")).to eq(4.0)
    end
  end
end
