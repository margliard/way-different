# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require "open-uri"

puts "Cleaning database..."

# Travelboard.destroy_all (method not created yet inside the controller)

puts "Creating database..."
# USER CONTROLLER NOT CREATED YET
# margot = User.create(first_name: "Margot", last_name: "Liard", email: "margot@gmail.com", password: "password")
# camille = User.create(first_name: "Camille", last_name: "Breillot", email: "camille@gmail.com", password: "password")
# sophie = User.create(first_name: "Sophie", last_name: "Callault", email: "sophie@gmail.com", password: "password")
# aymeric = User.create(first_name: "Aymeric", last_name: "Payen", email: "aymeric@gmail.com", password: "password")

puts "Creating Users..."

margot = User.create(email: "margot@gmail.com", password: "password")
camille = User.create(email: "camille@gmail.com", password: "password")
sophie = User.create(email: "sophie@gmail.com", password: "password")
aymeric = User.create(email: "aymeric@gmail.com", password: "password")
puts "users ok"
puts "------"
puts "Creating travelboards..."

Travelboard.create(user_id: 1, name: "Canada", start_date: "02/11/2021", end_date: "14/11/2021", status: false)

puts "Finished!"
