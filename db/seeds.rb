# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Win.destroy_all
User.destroy_all

user_1 = User.create!(name: "Wolfie")
user_2 = User.create!(name: "Maggie")
user_3 = User.create!(name: "Loki")

win_1 = user_1.wins.create!(entry: "I made a friend")
win_2 = user_1.wins.create!(entry: "I ate an old chip off the ground")

win_3 = user_2.wins.create!(entry: "My mom gave me a carrot")
win_4 = user_2.wins.create!(entry: "I found a loaf of bread", created_at: "2023-08-01")

win_5 = user_3.wins.create!(entry: "I got some snuggles", created_at: "2023-08-01")
win_6 = user_3.wins.create!(entry: "I destroyed a stuffie", created_at: "2023-08-01")