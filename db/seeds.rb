require 'factory_bot_rails'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

usernames = ['Scott Drybread', 'Kim Brewmeister', 'Chris Ocean', 'Craig Mountain', 'Nikki B', 'Rachel H', 'Zach S', 'Olivia W']
end_date = DateTime.parse(Time.now.to_s) -1
dates = ((end_date-29)..end_date).map {|d| d.strftime "%Y-%m-%d"}

users = usernames.map {|name| FactoryBot.create(:user, username: name)}
users.each do |user|
  dates.each do |date|
    FactoryBot.create(:daily_record, user_id: user.id, date: date )
  end
end

dummy_users = FactoryBot.create_list(:user, 250, username: 'botuser')
dummy_users.each do |user|
  FactoryBot.create(:daily_record, user_id: user.id, date: dates[0])
  FactoryBot.create(:daily_record, user_id: user.id, date: dates[10])
  FactoryBot.create(:daily_record, user_id: user.id, date: dates[20])
end