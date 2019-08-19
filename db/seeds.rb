# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Brand.destroy_all
Campaign.destroy_all
Campaign_Influencer.destroy_all
Influencer.destroy_all

#create some User data
25.times do 
    Brand.create(name: Faker::Company.name, year_founded: Faker::Date.between(from: 3650.days.ago, to: Date.today), description: Faker::Company.profession)
end
