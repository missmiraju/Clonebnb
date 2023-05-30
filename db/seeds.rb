# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# add the tags
require 'faker'

def addUserTags(user, num)
  num.times do
    utag = UserTag.new
    utag.user_id = user.id
    utag.tag = Tag.all.sample
    utag.save
  end
end

tags = %w[Painting Singing Dancing Photography Running Weightlifting Politics Sci-Fi Environmentalism Yoga Winter sports Partying Reading Parenting Computers]
tags << "Dog lover"
tags << "Cat lover"
tags << "Film & TV"
tags << "Playing an instrument"

tags.each do |tag|
  Tag.create(title: tag)
end

tags_exist = Tag.all.last(20).length == tags.length
if tags_exist
  puts "Tags have been created successfully"
else
  puts "There was an error in the tag creation"
end

# generate admin and 7 demo users
if tags_exist
  # add the admin
  admin = User.new(
    email: "admin@admin.com",
    password: "123456",
    first_name: "admin",
    last_name: "Meier",
    username: "__TheAdmin__",
    description: "I am the admin.",
    profile_picture_url: "https://thumbs.dreamstime.com/z/happy-man-okay-sign-portrait-white-background-showing-31418338.jpg",
    age: "2000-01-01",
    gender: "No, thanks"
  )

  if admin.save
    puts "admin created"

    admin = User.first
    addUserTags(admin, 3)
  else
    puts "admin count not be created"
  end

  # add 7 demo users
  7.times do |num|
    age = Faker::Date.birthday(min_age: 18, max_age: 65)
    demo_user = User.new(
      email: "#{num + 1}@friend.com",
      password: "123456",
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      username: Faker::Internet.username,
      description: Faker::Quotes::Shakespeare.hamlet_quote,
      profile_picture_url: "https://www.shutterstock.com/image-photo/profile-side-photo-young-handsome-260nw-1909369393.jpg",
      age: "#{age.year}-#{age.month}-#{age.day}",
      gender: Faker::Gender.type
    )

    if demo_user.save
      puts "Demo user #{num + 1} \"#{demo_user.username}\" has been created"
      demo_user = User.last

      addUserTags(demo_user, 3)
    else
      puts "Demo user #{num + 1} \"#{demo_user.username}\" could not be saved"
    end
  end
end
