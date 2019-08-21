# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "beginning seed"

Brand.destroy_all
# Campaign.destroy_all
# Campaign_Influencer.destroy_all
Influencer.destroy_all

#create some Brand data
25.times do 
    Brand.create(name: Faker::Company.name, year_founded: Faker::Date.between(from: 3650.days.ago, to: Date.today), description: Faker::Company.profession)
end

#create some Influencer data
25.times do 
    Influencer.create(name: Faker::Name.name, role: ["Athlete", "Agent", "Team", "Event"].sample, age: Faker::Number.between(from: 18, to: 100), gender: Faker::Gender.binary_type, social_media: Faker::Number.between(from: 500, to: 10000), sport: ["Baseball", "Basketball", "Boxing", "Cricket", "Crossfit", "Diving", "Figureskating", "Fishing", "Football", "Golf", "Hockey", "Lacrosse", "MMA", "Powerlifting", "Swimming", "Skiing", "Snowboarding", "Skateboarding", "Snowmobiling", "Soccer", "Tennis", "Wrestling"].sample, location: Faker::Nation.flag, image_url: Faker::SlackEmoji, password: Faker::Number.number(digits: 5))
end

puts "ending seed"
