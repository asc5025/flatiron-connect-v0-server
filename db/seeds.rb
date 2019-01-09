# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "albertchun@mail.com", password: "123", full_name: "Albert Chun", img_url: "https://i.imgur.com/h7BvZ39.png", current_company: "Barbell Inc", current_industry: "Fitness", current_position: "Chief Savage Officer")
User.create(email: "mikeyu@mail.com", password: "123", full_name: "Mike Yu", img_url: "https://i.imgur.com/9pIePlt.png", current_company: "Donations App", current_industry: "Non-Profit", current_position: "Founder")
User.create(email: "caram@mail.com", password: "123", full_name: "Cara Morelli" , img_url: "https://i.imgur.com/POp8O5e.png", current_company: "VR World", current_industry: "Techonology", current_position: "Lead VR Developer")
User.create(email: "vera@mail.com", password: "123", full_name: "Vera Protopopova" , img_url: "https://i.imgur.com/0FnKUwG.png", current_company: "BookFace", current_industry: "Social Media", current_position: "React Goddess")
