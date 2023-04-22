# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User1 = User.create!(email: "tester@example.com", password: "password123", password_confirmation: "password123")
Sleep = Category.create(name: "Sleep")
Study = Category.create(name: "Study")

sleep_40 = Challenge.create(name: "Sleep 40 hours a week", category: Sleep, goal: 40, progress: 0, units: "hours", ends_at: Date.parse("2023-12-31"), user: User1)
study_18 = Challenge.create(name: "Study 18 hours a week", category: Study, goal: 18, progress: 0, units: "hours", ends_at: Date.parse("2023-12-31"), user: User1)

Activity.create(challenge: sleep_40, amount: 8, note: "Went to bed on time", user: User1)
Activity.create(challenge: study_18, amount: 3, note: "Got it done right after lunch", user: User1)