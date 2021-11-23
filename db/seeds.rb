# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning database..."
Experience.destroy_all

puts "Creating database..."

hotel1 = Experience.create(category: "Accommodation", name: "Ecolodge Mirador", address: "I-500 Condominio lomas de piedra grande, lote 4, cahuil, Pichilemu, Chili", availability: true, price: 60, country: "Chili", city: "Pichilemu", description: "Mirador de Cáhuil Eco Lodge is set in Pichilemu and offers free bikes and a terrace. This holiday home features a garden, barbecue facilities, free WiFi and free private parking.", booked: false)
restaurant1 = Experience.create(category: "Restaurant", name: "Cuarzo Restaurant", address: "Playa Hermosa Lote 6, Pichilemu 3220000 Chili", availability: true, country: "Chili", city: "Pichilemu", description: "Seafood restaurant near the main road", booked: false)
activity1 = Experience.create(category: "Activity", name: "Biking in Pichilemu", address: "Avenida Comercio 2241 Local 6, Pichilemu Chile", availability: true, price: 50, country: "Chili", city: "Pichilemu", description: "Rent a bike and visit the surroundings of Pichilemu", booked: false)

hotel2 = Experience.create(category: "Accommodation", name: "Comarca Valparaíso", address: "San Juan de Dios 601, 2380507 Valparaíso, Chili", availability: true, price: 90, country: "Chili", city: "Valparaíso", description: "Comarca Valparaíso is located in Valparaíso and offers self-catering accommodation. Free Wi-Fi access is available. The property is 800 m from Cerro Concepcion and 2.2 km from Cerro Alegre.", booked: false)
restaurant2 = Experience.create(category: "Restaurant", name: "Ápice Cocina De Mar", address: "Lautaro Rosas 343 Cerro Alegre, Valparaiso Chile", availability: true, country: "Chili", city: "Valparaíso", description: "This is a restaurant run by people with a passion for providing excellent food and service. As well as a charming ambience and well spaced tables, the views over Valparaiso are stunning", booked: false)
activity2 = Experience.create(category: "Activity", name: "Reserva Nacional Lago Penuelas", address: "89 de la ruta 68, Valparaiso 2520000 Chile", availability: true, price: 50, country: "Chili", city: "Valparaíso", description: "Visit this wonderful natural reserve", booked: false)

puts "Experiences ok..."
