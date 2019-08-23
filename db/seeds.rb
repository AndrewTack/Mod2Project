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
Campaign.destroy_all
CampaignInfluencer.destroy_all
Influencer.destroy_all

#create some Brand data
25.times do 
    Brand.create(name: Faker::Company.name, year_founded: rand(1900...2019), description: Faker::Company.bs, password: 'pass123')
end

#create some Influencer data
25.times do 
    Influencer.create(name: Faker::Name.name, role: ["Athlete", "Agent", "Team", "Event"].sample, age: Faker::Number.between(from: 18, to: 100), gender: Faker::Gender.binary_type, social_media: Faker::Number.between(from: 500, to: 10000), sport: ["Baseball", "Basketball", "Boxing", "Cricket", "Crossfit", "Diving", "Figureskating", "Fishing", "Football", "Golf", "Hockey", "Lacrosse", "MMA", "Powerlifting", "Swimming", "Skiing", "Snowboarding", "Skateboarding", "Snowmobiling", "Soccer", "Tennis", "Wrestling"].sample, location: Faker::Nation.flag, image_url: Faker::SlackEmoji, password: 'pass123')
end

#create some Campaign data
25.times do 
    Campaign.create(brand_id: Brand.pluck(:id).sample, budget: Faker::Number.within(range: 100..100000), summary: Faker::Marketing.buzzwords, category: ["Food_Beverage", "Apparel", "Equipment", "Supplements"].sample, type_of: ["Social Media Post", "Guest Speaker", "Photoshoot", "Event Appearance", "Logo Placement", "Product Endorsement"].sample, 
    image_url: ["http://www.adema.me/wp-content/uploads/2016/04/adema_gamaia_fist_sign.jpg", "https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/d7a91c19552867.562dc572925a2.jpg", "https://cached.imagescaler.hbpl.co.uk/resize/scaleWidth/815/cached.offlinehbpl.hbpl.co.uk/news/SUC/NoMaybes1-20150714122724324.jpeg"].sample, 
    status: ["Pending", "Active", "Completed"].sample, 
    title: Faker::App.name)
end

#create some Campaign_Influencer data
25.times do 
    CampaignInfluencer.create(campaign_id: Campaign.pluck(:id).sample, influencer_id: Influencer.pluck(:id).sample,
    approval_status: [:approved, :pending].sample,
    pitch: Faker::Company.catch_phrase)
end

puts "ending seed"
