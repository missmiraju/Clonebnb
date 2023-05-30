# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

adminUser = User.create(email: "admin@admin.com", password: "123456",
                        first_name: "admin", last_name: "Meier",
                        username: "__TheAdmin__", description: "I am the admin.",
                        profile_picture_url: "https://thumbs.dreamstime.com/z/happy-man-okay-sign-portrait-white-background-showing-31418338.jpg",
                        age: "2000-01-01", gender: "No, thanks")
