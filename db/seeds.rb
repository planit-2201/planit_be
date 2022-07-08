# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
scott = User.create!(
  username: "Scott Drybread",
  flowrate: 1.8
)

scott.daily_records.create!(
  date: '2022-07-07',
  bag_count: 3,
  straw_count: 0,
  container_count: 2,
  shower_time: 0
)
scott.daily_records.create!(
  date: '2022-07-08',
  bag_count: 3,
  straw_count: 0,
  container_count: 2,
  shower_time: 0
)