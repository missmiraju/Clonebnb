# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# add the tags
tags = %w[Painting Singing Dancing Photography Running Weightlifting Politics Sci-Fi Environmentalism Yoga Winter sports Partying Reading Parenting Computers]
tags << "Dog lover"
tags << "Cat lover"
tags << "Film & TV"
tags << "Playing an instrument"

tags.each do |tag|
  Tag.create(title: tag)
end

# add the admin
User.create(email: "admin@admin.com", password: "123456",
            first_name: "admin", last_name: "Meier",
            username: "__TheAdmin__", description: "I am the admin.",
            profile_picture_url: "https://thumbs.dreamstime.com/z/happy-man-okay-sign-portrait-white-background-showing-31418338.jpg",
            age: "2000-01-01", gender: "No, thanks")
admin = User.first

tags_list = Tag.all.last(20)
3.times do
  utag = UserTag.new
  utag.user_id = admin.id
  utag.tag = tags_list.sample
  puts "user: #{utag.user_id}"
  puts "tag:  #{utag.tag_id}"
  utag.save
end
