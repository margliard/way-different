# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



require "open-uri"

puts "Cleaning database..."
# ReviewTravelboard.destroy_all (method not created yet inside the controller)
# ReviewExperience.destroy_all (method not created yet inside the controller)
Experience.destroy_all
# Travelboard.destroy_all (method not created yet inside the controller)
User.destroy_all

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

canada = Travelboard.create(user_id: margot.id, name: "Canada", start_date: "02/11/2021", end_date: "14/11/2021", status: false)
chile = Travelboard.create(user_id: camille.id, name: "Chile", start_date: "02/11/2021", end_date: "14/11/2021", status: false)
sri = Travelboard.create(user_id: sophie.id, name: "Sri Lanka", start_date: "02/11/2021", end_date: "14/11/2021", status: false)


puts "Travelboards ok..."
puts "Creating experiences..."


hotel1 = Experience.create(category: "Accommodation", name: "Ecolodge Mirador", address: "KM 2 Camino A Chile Chico, Chile Chico, Aysén, Chili", availability: true, price: 60, country: "Chili", city: "Pichilemu", description: "Mirador de Cáhuil Eco Lodge is set in Pichilemu and offers free bikes and a terrace. This holiday home features a garden, barbecue facilities, free WiFi and free private parking.", booked: false, image_url: "https://cf.bstatic.com/xdata/images/hotel/max1024x768/241038355.jpg?k=6eb206e98fbdd06ba2d4b1af121c24cea0dea2a02baad0bfefbe4e9d1762af18&o=&hp=1")
restaurant1 = Experience.create(category: "Restaurant", name: "Cuarzo Restaurant", address: "punta de lobos camino a cahuil, cruce, Pichilemu, O'Higgins, Chili", availability: true, country: "Chili", city: "Pichilemu", description: "Seafood restaurant near the main road", booked: false, image_url: "https://media-cdn.tripadvisor.com/media/photo-s/0d/dc/73/2e/restaurant.jpg")
activity1 = Experience.create(category: "Activity", name: "Biking in Pichilemu", address: "Pichilemu Chile", availability: true, price: 50, country: "Chili", city: "Pichilemu", description: "Rent a bike and visit the surroundings of Pichilemu", booked: false, image_url: "https://worldinparis.com/wp-content/uploads/2017/05/Vintage-Bikes-in-Paris.jpg")

hotel2 = Experience.create(category: "Accommodation", name: "Comarca Valparaíso", address: "San Juan de Dios 601, 2380507 Valparaíso, Chili", availability: true, price: 90, country: "Chili", city: "Valparaíso", description: "Comarca Valparaíso is located in Valparaíso and offers self-catering accommodation. Free Wi-Fi access is available. The property is 800 m from Cerro Concepcion and 2.2 km from Cerro Alegre.", booked: false, image_url: "https://i0.wp.com/apuntesyviajes.com/wp-content/uploads/2021/10/comarca_valparaiso_01.jpg?ssl=1")
restaurant2 = Experience.create(category: "Restaurant", name: "Ápice Cocina De Mar", address: "Lautaro Rosas 343 Cerro Alegre, Valparaiso Chile", availability: true, country: "Chili", city: "Valparaíso", description: "This is a restaurant run by people with a passion for providing excellent food and service. As well as a charming ambience and well spaced tables, the views over Valparaiso are stunning", booked: false, image_url: "https://pbs.twimg.com/media/DThQbOaXcAE0PtL.jpg")
activity2 = Experience.create(category: "Activity", name: "Reserva Nacional Lago Penuelas", address: "Reserva Nacional Lago Peñuelas, Valparaíso, Chili", availability: true, price: 50, country: "Chili", city: "Valparaíso", description: "Visit this wonderful natural reserve", booked: false, image_url: "https://i.ytimg.com/vi/2fdBb0c9Z6g/maxresdefault.jpg")

puts "Experiences ok..."

puts "Traveldays creation..."
td1 = Travelday.create(travelboard_id: canada.id, day_number: 1)
td2 = Travelday.create(travelboard_id: canada.id, day_number: 2)
td3 = Travelday.create(travelboard_id: canada.id, day_number: 3)
td4 = Travelday.create(travelboard_id: canada.id, day_number: 4)

puts "Traveldays ok"

puts "creating favorites"
fav1 = Favorite.create(experience_id: hotel1.id, travelday_id: td1.id)
fav2 = Favorite.create(experience_id: hotel2.id, travelday_id: td2.id)
fav3 = Favorite.create(experience_id: hotel1.id, travelday_id: td3.id)
fav4 = Favorite.create(experience_id: hotel2.id, travelday_id: td4.id)

puts "Finished"
