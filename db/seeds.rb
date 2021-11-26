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
margot = User.create(email: "margot@gmail.com", password: "password", profile_photo: "margot_liard_trombi_cw3tx8", username: "Margot")
camille = User.create(email: "camille@gmail.com", password: "password", profile_photo: "960151_1573833412_YRTF3U_kk1ekh", username: "Camille")
sophie = User.create(email: "sophie@gmail.com", password: "password", profile_photo: "Screenshot_2021-11-26_at_11.57.36_ifl2jj", username: "Sophie")
aymeric = User.create(email: "aymeric@gmail.com", password: "password", profile_photo: "Screenshot_2021-11-26_at_11.57.59_f2t8qm", username: "Aymeric")
puts "users ok"
puts "Creating travelboards..."
costa1 = Travelboard.create(user_id: margot.id, country: "Costa Rica", name: "My travel in Costa Rica", start_date: "05/08/2021", end_date: "20/08/2021", status: false)
costa2 = Travelboard.create(user_id: camille.id, country: "Costa Rica", name: "Costa Rica 2019", start_date: "02/08/19", end_date: "14/08/2019", status: false)
costa3 = Travelboard.create(user_id: sophie.id, country: "Costa Rica", name: "Costa Rica - East Coast", start_date: "06/07/2021", end_date: "22/07/2021", status: false)
puts "Travelboards ok..."
puts "Creating experiences..."
hotel1 = Experience.create(category: "Accommodation", name: "Tranquilo Bay Eco Adventure Lodge", address: "Monteverde Costa Rica", availability: true, price: 80, country: "Costa Rica", city: "Monteverde", description: "Centrally located among the most biologically diverse protected areas in Central America, this adventure eco-lodge in Panama will give you the authentic vacation experience you desire. When you stay in one of Tranquilo Bay’s nine stylish cabanas, you can start your morning by walking out onto the wrap-around elevated porch to get a view of the mangrove forest and the Caribbean Sea meeting the lush green rainforest. You can be sure you’re having a sustainable, environmentally-friendly vacation when you stay at this boutique hotel", booked: false, image_url: "https://regenerativetravel.com/wp-content/uploads/2019/07/4-1024x684-1.jpg")
restaurant1 = Experience.create(category: "Restaurant", name: "Farm to Table Escondido", address: "Santa Elena Costa Rica", availability: true, country: "Costa Rica", city: "Santa Elena", description: "Little hidden gem of a cafe with a big view to boast. Great seating area upstairs to enjoy the views and with a lovely garden.", booked: false, image_url: "https://media-cdn.tripadvisor.com/media/photo-s/15/9f/ee/5f/cafe-second-floor-view.jpg")
activity1 = Experience.create(category: "Activity", name: "Taste the fruit of a pioneering regenerative farm", address: "Jicaral Costa Rica", availability: true, price: 50, country: "Costa Rica", city: "Jicaral", description: "Finca Luna Nueva is a leading exponent of the “regenerative agriculture” revolution, and a visit to their farm will introduce you to a “beyond organic” celebration of holistic food production, including 90 species of tropical fruit trees.", booked: false, image_url: "https://c.stocksy.com/a/GjrE00/z9/3543130.jpg")
hotel2 = Experience.create(category: "Accommodation", name: "Finca Luna Nueva", address: "Manzanillo Costa Rica", availability: true, price: 90, country: "Costa Rica", city: "Manzanillo", description: "ack your binoculars and prepare yourself for a relaxing and educational vacation at this birder’s paradise in Peñas Blancas, Costa Rica. With charming bungalow rooms and traditional woven hammocks scattered across the property, this boutique eco-lodge is located in an environment that combines biodiversity, birdsong, and beauty. Adjacent to the 50,000-acre Children’s Eternal Rainforest conservation area, this hotel gives you the chance to connect with the pristine nature of Central America in a sustainable way, soaking in all that a thriving tropical rainforest has to offer.", booked: false, image_url: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/59894488.jpg?k=81f28cb57f993a682315bdc140582698c8512cb155959a4ae57cda036d80c9ea&o=&hp=1")
restaurant2 = Experience.create(category: "Restaurant", name: "Harmony Restaurant", address: "Las Juntas Costa Rica", availability: true, country: "Costa Rica", city: "Las Juntas", description: "This is a restaurant run by people with a passion for providing excellent food and service. As well as a charming ambience and well spaced tables, the views over Monteverde are stunning", booked: false, image_url: "https://www.yonder.fr/sites/default/files/destinations/Hotel_Tiskita_Lodge_4.jpg")
activity2 = Experience.create(category: "Activity", name: "Release baby sea turtles", address: "Jacó Costa Rica", availability: true, price: 50, country: "Costa Rica", city: "Jacó", description: "Witness the release of baby sea turtles as they instinctively scamper into the waves toward their new lives of open-ocean roaming.", booked: false, image_url: "http://images.dailyhive.com/20181113153741/Newborn-turtles-going-into-the-ocean.jpg")
hotel3 = Experience.create(category: "Accommodation", name: "Chira Eco-camping Monteverde", address: "Miramar Costa Rica", availability: true, price: 90, country: "Costa Rica", city: "Miramar", description: "You can be sure you’re having a sustainable, environmentally-friendly vacation when you stay at this boutique hotel. It uses the smallest amount of plastic possible when sending guests on excursions, and it sources large amounts of its food from within Panama, preparing as much of it onsite as possible. Tranquilo Bay even captures and purifies natural rainwater in its pledge to use water responsibly.", booked: false, image_url: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/276345931.jpg?k=fed6534332914d30787162a98011d4626cc2a77a962c1d2d2898bad58324dab9&o=&hp=1")
restaurant3 = Experience.create(category: "Restaurant", name: "El Mangroove", address: "Barranca Costa Rica", availability: true, country: "Costa Rica", city: "Barranca", description: "This is a restaurant run by people with a passion for providing excellent food and service. As well as a charming ambience and well spaced tables, the views over the mountain are stunning. It uses the smallest amount of plastic possible when sending guests on excursions, and it sources large amounts of its food from within Panama, preparing as much of it onsite as possible.", booked: false, image_url: "https://www.archi-living.com/wp-content/uploads/AW%C2%B2-Kasiiya-Papagayo-eco-resort-restaurant-design-photo-Kenny-Viese-Archi-living-D.jpg")
activity3 = Experience.create(category: "Activity", name: "Mountain Biking at Las Catalinas", address: "Bajamar Costa Rica", availability: true, price: 50, country: "Costa Rica", city: "Bajamar", description: "Cycling or biking in Costa Rica can be a lot of fun as the incredible scenery and challenging roads make for a great ride.  One can choose their challenge with mountainous rides, off road track riding, cruising along the flat coastal roads or a mix of all of them.", booked: false, image_url: "https://www.backroads.com/sites/default/files/trips/2018/slideshow/BCRI-costa-rica-bike-tour-1.jpg")
puts "Experiences ok..."
puts "Traveldays creation..."
td1 = Travelday.create(travelboard_id: costa1.id, day_number: 1)
td2 = Travelday.create(travelboard_id: costa1.id, day_number: 2)
td3 = Travelday.create(travelboard_id: costa1.id, day_number: 3)
td4 = Travelday.create(travelboard_id: costa1.id, day_number: 4)
td5 = Travelday.create(travelboard_id: costa2.id, day_number: 1)
td6 = Travelday.create(travelboard_id: costa2.id, day_number: 2)
td7 = Travelday.create(travelboard_id: costa2.id, day_number: 3)
td8 = Travelday.create(travelboard_id: costa2.id, day_number: 4)
puts "Traveldays ok"
puts "creating favorites"
fav1 = Favorite.create(experience_id: hotel1.id, travelday_id: td1.id)
fav2 = Favorite.create(experience_id: hotel2.id, travelday_id: td2.id)
fav3 = Favorite.create(experience_id: restaurant1.id, travelday_id: td1.id)
fav4 = Favorite.create(experience_id: restaurant2.id, travelday_id: td3.id)
fav5 = Favorite.create(experience_id: activity1.id, travelday_id: td4.id)
fav6 = Favorite.create(experience_id: activity3.id, travelday_id: td4.id)
fav7 = Favorite.create(experience_id: hotel3.id, travelday_id: td5.id)
fav8 = Favorite.create(experience_id: hotel2.id, travelday_id: td6.id)
fav9 = Favorite.create(experience_id: restaurant2.id, travelday_id: td5.id)
fav10 = Favorite.create(experience_id: activity2.id, travelday_id: td7.id)
fav11 = Favorite.create(experience_id: restaurant3.id, travelday_id: td7.id)
puts "Finished"
