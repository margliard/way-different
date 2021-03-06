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

# Travelboard.destroy_all (method not created yet inside the controller)
User.destroy_all
Favorite.destroy_all
ReviewExperience.destroy_all
Experience.destroy_all
Message.destroy_all
Chatroom.destroy_all
ReviewTravelboard.destroy_all
Travelboard.destroy_all
Travelday.destroy_all

def random_labels()
  number_of_label = rand(1..4)
  array_of_labels = ["Renewable energies", "Recycling waste", "No single use plastics", "Vegetable garden"]
  i = 1
  while i < number_of_label
    array_of_labels.delete_at(rand(array_of_labels.length))
    i+=1
  end
  array_of_labels
end

puts "Creating database..."
# USER CONTROLLER NOT CREATED YET
# margot = User.create(first_name: "Margot", last_name: "Liard", email: "margot@gmail.com", password: "password")
# camille = User.create(first_name: "Camille", last_name: "Breillot", email: "camille@gmail.com", password: "password")
# sophie = User.create(first_name: "Sophie", last_name: "Callault", email: "sophie@gmail.com", password: "password")
# aymeric = User.create(first_name: "Aymeric", last_name: "Payen", email: "aymeric@gmail.com", password: "password")

puts "Creating Users..."
# From github
source = "àâçèéêëîôùû"
dest= "aaceeeeiouu"
f= File.open("./app/assets/images/user-seed/users.html").read
doc = Nokogiri::HTML(f)
# p doc
doc.search('.col-12.d-flex.p-3').each do |element|
  # p element
  name = element.search('.clasmates-student-links strong').text.tr(source, dest)
  name
  name_array = name.split(" ")
  photo = element.search('.img-thumbnail').attribute('src').value
  photo = photo.gsub("./","")
  photo = "user-seed/#{photo}"[-4] == '.' ? "user-seed/#{photo}" : "user-seed/#{photo}.jpg"
  email = "#{name_array[0].downcase}-#{name_array[1].downcase}@gmail.com"
  password = "password"
  user = User.create!(email: email, profile_photo: photo, username: "#{name_array[0]} #{name_array[1][0]}", password: "password")
end

margot = User.create(email: "margot@gmail.com", password: "password", profile_photo: "https://pbs.twimg.com/profile_images/932603275265880066/4GMvyQaw_400x400.jpg", username: "Margot")
camille = User.create(email: "camille@gmail.com", password: "password", profile_photo: "https://media-exp1.licdn.com/dms/image/C4D03AQFZXD9yY1VO2g/profile-displayphoto-shrink_200_200/0/1522616037980?e=1643241600&v=beta&t=thr7EEPiWQdTZ_WIterKAL3lui_nNFxlNwm52OXK87Y", username: "Camille")
sophie = User.create(email: "sophie@gmail.com", password: "password", profile_photo: "https://ca.slack-edge.com/T02NE0241-U02G8J3UGH4-7e00009b17a6-512", username: "Sophie")
aymeric = User.create(email: "aymeric@gmail.com", password: "password", profile_photo: "https://ca.slack-edge.com/T02NE0241-U02FLRDV86S-e6a34883f5c0-512", username: "Aymeric")

puts "users ok"
puts "Creating travelboards..."
costa1 = Travelboard.create(user_id: margot.id, country: "Costa Rica", name: "My travel in Costa Rica", start_date: "05/08/2021", end_date: "20/08/2021", status: false)
file1 = URI.open("https://blog.vamosrentacar.fr/wp-content/uploads/2019/10/gardens-costa-rica-arenal-volcano-in-costa-rica-hero-730x300.jpg")
costa1.photo.attach(io: file1, filename: 'file1.jpeg', content_type: 'image/jpeg')
costa2 = Travelboard.create(user_id: camille.id, country: "Costa Rica", name: "Costa Rica 2019", start_date: "02/08/19", end_date: "14/08/2019", status: false)
file2 = URI.open("https://www.destinationcocktails.fr/wp-content/uploads/2020/01/costa-rica1.-1.jpg")
costa2.photo.attach(io: file2, filename: 'file2.jpeg', content_type: 'image/jpeg')
puts "Travelboards ok..."

puts "Creating Labels ...."
restaurant_labels = ["Organic", "Zero waste", "Sustainable meat", "Container accepted", "Locavore", "Short Circuit", "Sustainable fishing", "Veggie"]
restaurant_labels.each do |restaurant_label|
  Label.create(label_name: restaurant_label, label_icon: "#{restaurant_label.gsub(" ", "_").downcase}.png")
end

hotels_label = ["Renewable energies", "Recycling waste", "No single use plastics", "Vegetable garden"]
hotels_label.each do |hotel_label|
  Label.create(label_name: hotel_label, label_icon: "#{hotel_label.gsub(" ", "_").downcase}.png")
end
puts 'Label OK'

# Hotels
# hotel# = Experience.create(category:"Accommodation", name: "", address: "", availability: true , price:, country: "", city: "", image_url: "", description: "")

price = ["€","€€","€€€","€€€€"]
hotel1 = Experience.create(category: "Accommodation", name: "Tranquilo Bay Eco Adventure Lodge", address: "Monteverde Costa Rica", availability: true, price: price.shuffle.first, country: "Costa Rica", city: "Monteverde", description: "Centrally located among the most biologically diverse protected areas in Central America, this adventure eco-lodge in Panama will give you the authentic vacation experience you desire. When you stay in one of Tranquilo Bay’s nine stylish cabanas, you can start your morning by walking out onto the wrap-around elevated porch to get a view of the mangrove forest and the Caribbean Sea meeting the lush green rainforest. You can be sure you’re having a sustainable, environmentally-friendly vacation when you stay at this boutique hotel", booked: false, image_url: "https://regenerativetravel.com/wp-content/uploads/2019/07/4-1024x684-1.jpg")
hotel1_random_labels = random_labels
hotel1_random_labels.each do |label|
  p label
  p ExperienceLabel.create(experience_id: hotel1.id, label: Label.find_by(label_name: label.strip))
end
hotel2 = Experience.create(category: "Accommodation", name: "Finca Luna Nueva", address: "Manzanillo Costa Rica", availability: true, price: price.shuffle.first, country: "Costa Rica", city: "Manzanillo", description: "ack your binoculars and prepare yourself for a relaxing and educational vacation at this birder’s paradise in Peñas Blancas, Costa Rica. With charming bungalow rooms and traditional woven hammocks scattered across the property, this boutique eco-lodge is located in an environment that combines biodiversity, birdsong, and beauty. Adjacent to the 50,000-acre Children’s Eternal Rainforest conservation area, this hotel gives you the chance to connect with the pristine nature of Central America in a sustainable way, soaking in all that a thriving tropical rainforest has to offer.", booked: false, image_url: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/59894488.jpg?k=81f28cb57f993a682315bdc140582698c8512cb155959a4ae57cda036d80c9ea&o=&hp=1")
hotel2_random_labels = random_labels
hotel2_random_labels.each do |label|
  p label
  p ExperienceLabel.create(experience_id: hotel2.id, label: Label.find_by(label_name: label.strip))
end
hotel3 = Experience.create(category: "Accommodation", name: "Chira Eco-camping Monteverde", address: "Miramar Costa Rica", availability: true, price: price.shuffle.first, country: "Costa Rica", city: "Miramar", description: "You can be sure you’re having a sustainable, environmentally-friendly vacation when you stay at this boutique hotel. It uses the smallest amount of plastic possible when sending guests on excursions, and it sources large amounts of its food from within Panama, preparing as much of it onsite as possible. Tranquilo Bay even captures and purifies natural rainwater in its pledge to use water responsibly.", booked: false, image_url: "https://cf.bstatic.com/xdata/images/hotel/max1280x900/276345931.jpg?k=fed6534332914d30787162a98011d4626cc2a77a962c1d2d2898bad58324dab9&o=&hp=1")
hotel3_random_labels = random_labels
hotel3_random_labels.each do |label|
  p label
  p ExperienceLabel.create(experience_id: hotel3.id, label: Label.find_by(label_name: label.strip))
end
hotel4 = Experience.create(category: "Accommodation", name: "Chalet du Lys", address: "Val-Cenis, France", availability: true , price: price.shuffle.first, country: "France", city: "Termignon", image_url:"https://img.ecobnb.net/media/cache/wide_8/media/uploads/60e0ce82c1c11e7ebee50aaf0675d43f2d45df07.jpeg", description: "Elise and Fred welcome you all year at Chalet du Lys in Haute Maurienne Vanoise. Located 2 minutes from the village of Termignon (Station Val Cenis), surrounded by nature, overlooking the Dent Parrachée (3rd summit of the Vanoise National Park), the Chalet du Lys offers a warm atmosphere in a sunny and calm. Chalet du Lys was honored for his commitment to nature and sustainable mobility by labeling 'Accommodation Alpine Pearls'")
hotel4_random_labels = random_labels
hotel4_random_labels.each do |label|
  p label
  p ExperienceLabel.create(experience_id: hotel4.id, label: Label.find_by(label_name: label.strip))
end
hotel5 = Experience.create(category: "Accommodation", name: "Nuit a Pleiney - Natura e Relax", address: "Saint Rhemy, Italy", availability: true , price:price.shuffle.first, country: "Italy", city: "Saint Rhemy", image_url: "https://img.ecobnb.net/media/cache/wide_8/media/uploads/9e73b21bfc686dcb7b554b45a468cc69b8360d8f.jpeg", description: "Larch and fir trees all around, the stream that keeps company, large green spaces and a wellness area with Scandinavian tub, Finnish sauna, old wooden chalets to give you a living room to tell. Ideal place for winter and summer sports.")
hotel5_random_labels = random_labels
hotel5_random_labels.each do |label|
  p label
  p ExperienceLabel.create(experience_id: hotel5.id, label: Label.find_by(label_name: label.strip))
end
hotel6 = Experience.create(category: "Accommodation", name: "Mystic Marmot chalet in the alps", address: "Saint-Ferréol, France", availability: true , price:price.shuffle.first, country: "France", city: "Leschaux",image_url: "https://img.ecobnb.net/media/cache/wide_8/media/uploads/11b296980f278fc74d4234ab1b8024e25398d10f.jpeg", description: "High in the Alps at 1000 meters above sea level, this chalet offers a unique off-the-grid experience. It sits on an immense 12 hectare property deep in nature, surrounded by mountains and has great outdoor activities and adventures year-round. The mystic Marmot gives guests the impression of being secluded from everyday worries, nestled cosy in their home away from home. There are endless adventures to be had here with stunning views, nature and wildlife. If you like hiking, skiing, mushroom picking or relaxing in front of a fireplace, this place is for you. Everyone's welcome from couples, solo adventurers, families, big groups, and furry friends.")
hotel6_random_labels = random_labels
hotel6_random_labels.each do |label|
  p label
  p ExperienceLabel.create(experience_id: hotel6.id, label: Label.find_by(label_name: label.strip))
end
hotel7 = Experience.create(category: "Accommodation", name: "Residence Le Petit Coeur - La Salle", address: "La Salle, Italie", availability: true , price:price.shuffle.first, country: "Italy", city: "La Salle", image_url: "https://img.ecobnb.net/media/cache/wide_8/media/uploads/08076cabd3dfa8e86bb877503729ec32fcb78112.jpeg", description: "An ancient farm house carefully transformed into a small 3-star eco-friendly residence, surrounded by greenery at the foot of Mont-Blanc in the Aosta Valley. An eco-friendly house at the foot of Mount Blanc. Seven beautiful apartments full of charm and tradition, built in the old barn. The furnishings are in wood recovered from the old floors. The materials used recall the history and beauty of ancient Alpine traditions.")
hotel7_random_labels = random_labels
hotel7_random_labels.each do |label|
  p label
  p ExperienceLabel.create(experience_id: hotel7.id, label: Label.find_by(label_name: label.strip))
end
hotel8 = Experience.create(category: "Accommodation", name: "Relais du Paradis Chambres d'Hôtes", address: "Frazione Villes Dessous, 53 Introd", availability: true , price:price.shuffle.first, country: "Italy", city: "Aosta", image_url: "https://img.ecobnb.net/media/cache/wide_8/media/uploads/7c2bb8c3ce4e58a2d9f2516d8e65a96fa2c0feab.jpeg", description: "A cozy B & B in the heart of wood Gran Paradiso National Park, ideal for a holiday with children, but also for a romantic nature and wellness. Relais du Paradis is a cozy B & B in the heart of the National Park of Gran Paradiso, in Villes Dessus, a small hamlet situated at the beginning of the town of Introd, surrounded by meadows where graze freely goats, sheep, cows and horses.")
hotel8_random_labels = random_labels
hotel8_random_labels.each do |label|
  p label
  p ExperienceLabel.create(experience_id: hotel8.id, label: Label.find_by(label_name: label.strip))
end
hotel9 = Experience.create(category:"Accommodation", name: "Auberge La Clusaz", address: "La Clusaz, France", availability: true , price:price.shuffle.first, country: "France", city: "La Clusaz", image_url: "https://img.ecobnb.net/media/cache/wide_8/media/uploads/6aaa4e2932eccf56570cb81b6199f8e7d6c08468.jpeg", description: "Auberge La Clusaz offers a warm lodging, the cottage, covered, in its two adjoining cottages. One is an old farmhouse Aravis early 20th century, completely restored to showcase its traditional character Savoie chalet. The adjacent cottage is in the style of mountain habitat. Both enjoy an exceptional view of the Aravis Valley.")
hotel9_random_labels = random_labels
hotel9_random_labels.each do |label|
  p label
  p ExperienceLabel.create(experience_id: hotel9.id, label: Label.find_by(label_name: label.strip))
end
#hotel10 = Experience.create(category:"Accommodation", name: "", address: "", availability: true , price:, country: "France", city: "", image_url: "", description: "")

puts "Creating hotels..."
hotels = JSON.parse(File.read('db/hotels.json'))
hotels.each do |element|
  hotel_random_labels = random_labels
  Experience.create!(element)
  hotel_random_labels.each do |label|
    ExperienceLabel.create(experience_id: Experience.last.id, label: Label.find_by(label_name: label.strip))
  end
end
puts 'Hotel OK'
puts 'Creating experience restaurant...'
#Restaurants
# Experience.create(category:"Restaurant", name: "", address: "", availability: true , price:, country: "", city: "", image_url: "", description: "")
restaurant1 = Experience.create(category: "Restaurant", name: "Farm to Table Escondido", address: "Santa Elena Costa Rica", availability: true, country: "Costa Rica", city: "Santa Elena", description: "Little hidden gem of a cafe with a big view to boast. Great seating area upstairs to enjoy the views and with a lovely garden.", booked: false, image_url: "https://media-cdn.tripadvisor.com/media/photo-s/15/9f/ee/5f/cafe-second-floor-view.jpg")
restaurant2 = Experience.create(category: "Restaurant", name: "Harmony Restaurant", address: "Las Juntas Costa Rica", availability: true, country: "Costa Rica", city: "Las Juntas", description: "This is a restaurant run by people with a passion for providing excellent food and service. As well as a charming ambience and well spaced tables, the views over Monteverde are stunning", booked: false, image_url: "https://www.yonder.fr/sites/default/files/destinations/Hotel_Tiskita_Lodge_4.jpg")
restaurant3 = Experience.create(category: "Restaurant", name: "El Mangroove", address: "Barranca Costa Rica", availability: true, country: "Costa Rica", city: "Barranca", description: "This is a restaurant run by people with a passion for providing excellent food and service. As well as a charming ambience and well spaced tables, the views over the mountain are stunning. It uses the smallest amount of plastic possible when sending guests on excursions, and it sources large amounts of its food from within Panama, preparing as much of it onsite as possible.", booked: false, image_url: "https://www.archi-living.com/wp-content/uploads/AW%C2%B2-Kasiiya-Papagayo-eco-resort-restaurant-design-photo-Kenny-Viese-Archi-living-D.jpg")
doc = Nokogiri::HTML(URI.open("https://ecotable.fr/en/ecotables"))
doc.search('.ecotables-ecotable').each do |element|
  link = element.search('a').attribute('href').value
  doc2 = Nokogiri::HTML(URI.open(link))
  doc2.search('.page-ecotable').each do |element2|
    titles = element2.search('h1').text
    descriptions = element2.search('.ecotable-paragraph p').text
    loc= element2.search('.ecotable-address span').text.strip
    city=loc.split(',').last
    images = element2.search('.lazy-img').attribute('data-lazy-src').value
    badges = element2.search('.ecotable-badges').text.split(',')
    price = ["€","€€","€€€","€€€€"]
    experience = Experience.create(category: "Restaurant", name: "#{titles}", address: "#{loc}", city: "#{city}", availability: true , country: "France", description: "#{descriptions}", price: price.shuffle.first, booked: false, image_url: "#{images}")
    badges.each do |badge|
      ExperienceLabel.create(experience_id: experience.id, label: Label.find_by(label_name: badge.strip))
    end
  end
end
puts 'restaurant OK'
#Activities
# Experience.create(category:"Activity", name: "", address: "", availability: true , price:, country: "", city: "", image_url: "", description: "")
price = ["€","€€","€€€","€€€€"]
activity1 = Experience.create(category: "Activity", name: "Pioneering regenerative farm", address: "Jicaral Costa Rica", availability: true, price: price.shuffle.first, country: "Costa Rica", city: "Jicaral", description: "Finca Luna Nueva is a leading exponent of the “regenerative agriculture” revolution, and a visit to their farm will introduce you to a “beyond organic” celebration of holistic food production, including 90 species of tropical fruit trees.", booked: false, image_url: "https://c.stocksy.com/a/GjrE00/z9/3543130.jpg")
activity2 = Experience.create(category: "Activity", name: "Release baby sea turtles", address: "Jacó Costa Rica", availability: true, price: price.shuffle.first, country: "Costa Rica", city: "Jacó", description: "Witness the release of baby sea turtles as they instinctively scamper into the waves toward their new lives of open-ocean roaming.", booked: false, image_url: "http://images.dailyhive.com/20181113153741/Newborn-turtles-going-into-the-ocean.jpg")
activity3 = Experience.create(category: "Activity", name: "Mountain Biking at Las Catalinas", address: "Bajamar Costa Rica", availability: true, price: price.shuffle.first, country: "Costa Rica", city: "Bajamar", description: "Cycling or biking in Costa Rica can be a lot of fun as the incredible scenery and challenging roads make for a great ride.  One can choose their challenge with mountainous rides, off road track riding, cruising along the flat coastal roads or a mix of all of them.", booked: false, image_url: "https://www.backroads.com/sites/default/files/trips/2018/slideshow/BCRI-costa-rica-bike-tour-1.jpg")
activity4 = Experience.create(category: "Activity", name: "Canoe-kayaking and water hiking", address: "Lac de Bournazel, 19700 SEILHAC", availability: true, price: price.shuffle.first, country: "France", city: "Seilhac", description: "Rental of canoes, pedalos and paddles, initiation and private lessons possible in summer on request and availability of an executive (+ kayak school all year round), rafting, aquarando in the Gorges de la Corrèze from 10 years old for beginners or initiated. For any nautical activity, it is imperative to know how to swim.", booked: false, image_url: "https://www.tulle-en-correze.com/wp-content/uploads/wpetourisme/155000609_27.jpg")
activity5 = Experience.create(category: "Activity", name: "Paragliding over the Corrèze", address: "Suc au May, Chaumeil, Corrèze", availability: true, price: price.shuffle.first, country: "France", city: "Chaumeil", description: "Do you dream of doing your paragliding baptism in a sumptuous setting? The dream is within reach with this tandem paragliding flight with an experienced instructor. 1 hour from Brive and Ussel, 45 minutes from Tulle and only 35 minutes from Egletons, you will fly above the Millevaches en Limousin regional natural park for unforgettable moments in the air.", booked: false, image_url: "https://img.adrenactive.com/img/3561/800_600/3561-11536-bapteme-parapente-suc-au-may-chaumeil-800.jpg")
activity6 = Experience.create(category:"Activity", name: "Snowshoe hiking", address: "Chamonix, France", availability: true , price: price.shuffle.first, country: "France", city: "Chamonix", image_url: "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0b/35/9f/0e.jpg", description: "With snowshoes on, let's go for a hike on the Vallon de Berard! The valley below is a glacial cirque surrounded by peaks that reach close to 3000 meters. An out of this world feel and alpine wonderland: cliffs, suspended glaciers, flora, and fauna... you might even get a glimpse of chamois, ibex. Also, it is a surprising migration corridor for the birds and insects that connect the Valais region of Switzerland and the Rhone Valley.")
activity7 = Experience.create(category:"Activity", name: "Paragliding flight", address: "Aix-les-Bains, France", availability: true , price: price.shuffle.first, country: "France", city: "Aix-les-Bains", image_url: "https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/0a/96/cd/5d.jpg", description: "Thanks to the paragliding flight in Savoie, explore the surroundings of Aix les Bains by air. Our team of state-certified aerology pilots accompanies you beyond the summits. In contemplative mode or in intense version, this tandem flight offers you a good overview of the lake region")
activity8 = Experience.create(category:"Activity", name: "Savoyard Vineyards Tour", address: "Cruet, France", availability: true , price: price.shuffle.first, country: "France", city: "Cruet", image_url: "https://www.producteurs-savoie-mont-blanc.com/medias/images/prestataires/multitailles/800x600_philippe-grisard-1294.jpg", description: "Discover the whole process of eco friendly wine making by vising our owned familly vineyards. We do not use harmful pesticides, herbicides, fungicides and chemical fertilisers and will show you how we do. You will be able to taste our production which has been organically farmed. This means that organic practises have been followed but without formal certification of the vineyard as organic. ")

puts "Activities ok..."
puts "creating review for experiences"

re1 = ReviewExperience.create(experience_id: hotel1.id, user_id:margot.id, comment: "The comforts of home with the jungle at your doorstep!", rating: "5")
re2 = ReviewExperience.create(experience_id: hotel1.id, user_id:sophie.id, comment: "Our recent stay at this fabulous lodge did not disappoint! Everything was truly phenomenal. The lodge is reached by a short boat ride from Bocas del Toro and the ride is gorgeous, with dolphin sightings along the way.
Our room was on the second story of a solid two story house (cabin 9) with a living area, oriental rugs, king size bed, spacious bathroom with fresh flowers and a lovely patio overlooking the lush grounds.", rating: "5")
re3 = ReviewExperience.create(experience_id: hotel1.id, user_id:aymeric.id, comment: "Delicious breakfasts, lunches and dinners were served in the main lodge house by ever attentive staff. This area also featured a little bar and a cozy sitting area surrounded by guide and coffee table books about the fauna of the region.
The great room also featured our absolute favorite component- a large wrap around deck over the jungle from which one could sip a drink, read a book and watch for tropical birds.", rating: "4,6")
re4 = ReviewExperience.create(experience_id: hotel1.id, user_id:camille.id, comment: "Amazing experiences each and every day. Guides had actual wildlife conservation experience, were super knowledgeable and accommodating. The owners and staff went beyond their way to ensure a top level stay", rating: "4.4")
re5 = ReviewExperience.create(experience_id: restaurant1.id, user_id: margot.id, comment: "The food was great, the service was excellent!", rating: "4,8")
re6 = ReviewExperience.create(experience_id: restaurant1.id, user_id: aymeric.id, comment: "As others have shared the Pizza here is wonderful. However all the other food items we tried were fantastic as well. Everything is freshly prepared and the prices were some of the best we saw during our CR adventure.", rating: "5")
re7 = ReviewExperience.create(experience_id: restaurant1.id, user_id: camille.id, comment: "We loved this place. The staff is fantastic, Gustavo and Helen jr make the best margaritas. Also the view from upstairs is amazing", rating: "4")
re8 = ReviewExperience.create(experience_id: restaurant1.id, user_id: sophie.id, comment: "Awesome pizza ! After a view days in Costa Rica we were craving for cheese and pizza.", rating: "4")
re9 = ReviewExperience.create(experience_id: activity1.id, user_id:camille.id, comment: "Nice activity, really fun to discover new flavours. I recommand.", rating: "5")
re10 = ReviewExperience.create(experience_id: activity1.id, user_id: aymeric.id, comment: "It was really fun, some weird fruits to taste! The guide was really nice, even though he flirted with my 18th year old daughter the entire time.... that's why this gets only 3/5.", rating: "3")
re11 = ReviewExperience.create(experience_id: activity1.id, user_id: margot.id, comment: "We had soooo much fuuun !! What a great activity to do !", rating: "5")
re12 = ReviewExperience.create(experience_id: activity1.id, user_id: sophie.id, comment: "Superbe tasting of amazing fruits ! loved it! ", rating: "5")
re13 = ReviewExperience.create(experience_id: restaurant2.id, user_id: aymeric.id, comment: "$20 for poached eggs. Ouch. Not even good ones. French toast was good. IT was 5 months ago and I'm still mad. the hotel of the restaurant is amazing though.", rating: "3")
re14 = ReviewExperience.create(experience_id: restaurant2.id, user_id: camille.id, comment: "Super high prices for what it is, you are paying for the location. While we had a few stand outs who treated us very well, at times it felt as if we were bothering the staff. The location is great, right next to the beach but with the hefty price tag", rating: "2")
re15 = ReviewExperience.create(experience_id: restaurant2.id, user_id: margot.id, comment: "Incredibly expensive, but a lovely time. Absolutely gorgeous. Very expensive. You get what you pay for.", rating: "5")
re16 = ReviewExperience.create(experience_id: restaurant2.id, user_id: sophie.id, comment: "I’ve only ate at the restaurant which is fantastic. Try there non-alcoholic fizzy’s.", rating: "4")
re17 = ReviewExperience.create(experience_id: activity2.id, user_id: margot.id, comment: "Unforgettable!", rating: "5")
re18 = ReviewExperience.create(experience_id: activity3.id, user_id: aymeric.id, comment: "Amazing landscape !", rating: "4")
re19 = ReviewExperience.create(experience_id: hotel2.id, user_id: camille.id, comment: "Very quiet!", rating: "4")
re20 = ReviewExperience.create(experience_id: restaurant3.id, user_id: sophie.id, comment: "Really good !", rating: "4")
# re13 = ReviewExperience.create(experience_id: restaurant2.id, user_id: aymeric.id, comment: "", rating: "")
# re13 = ReviewExperience.create(experience_id: restaurant2.id, user_id: aymeric.id, comment: "", rating: "")
# re13 = ReviewExperience.create(experience_id: restaurant2.id, user_id: aymeric.id, comment: "", rating: "")
# re13 = ReviewExperience.create(experience_id: restaurant2.id, user_id: aymeric.id, comment: "", rating: "")
# re13 = ReviewExperience.create(experience_id: restaurant2.id, user_id: aymeric.id, comment: "", rating: "")
# re13 = ReviewExperience.create(experience_id: restaurant2.id, user_id: aymeric.id, comment: "", rating: "")
# re13 = ReviewExperience.create(experience_id: restaurant2.id, user_id: aymeric.id, comment: "", rating: "")

puts "review exeriences ok"

puts "creating review for travelboards"
rt1 = ReviewTravelboard.create(travelboard_id: costa1.id, user_id: camille.id, comment: "Hey Waytraveller, It's such a lovely trip you did ! Thanks for sharing your ideas, i love your choices of activites <3", rating: "5")
rt2 = ReviewTravelboard.create(travelboard_id: costa1.id, user_id: sophie.id, comment: "You inspire me so much !!! Thanks for sharing, you're a great Waytraveller!", rating: "5")
rt3 = ReviewTravelboard.create(travelboard_id: costa1.id, user_id:aymeric.id, comment: "This trip gives me great ideas. I'm going to take my wife on a trip like that.", rating: "4")
rt4 = ReviewTravelboard.create(travelboard_id: costa2.id, user_id: aymeric.id, comment: "OOOh waw Waytraveller !  You are very creative, that trip looks so fun!", rating: "5")
rt5 = ReviewTravelboard.create(travelboard_id: costa2.id, user_id: margot.id, comment: "HI Waytraveller ! I love how you manage to do so much in so little time ! I'm going to get some really good inspirations here!", rating: "4")
rt6 = ReviewTravelboard.create(travelboard_id: costa2.id, user_id: sophie.id, comment: "Great trip ! Were the prices low at this time of the year ? I tend to go on trip in the low season like you ! It looked fun, can't wait to see your next trip!", rating: "5")

# rt11 = ReviewTravelboard.create(travelboard_id:, user_id:, comment: "", rating: "")
# rt12 = ReviewTravelboard.create(travelboard_id:, user_id:, comment: "", rating: "")
# rt13 = ReviewTravelboard.create(travelboard_id:, user_id:, comment: "", rating: "")

puts "review travelboards ok"

puts "Traveldays creation..."
td0 = Travelday.create(travelboard_id: costa1.id, day_number: 0)
td1 = Travelday.create(travelboard_id: costa1.id, day_number: 1)
td2 = Travelday.create(travelboard_id: costa1.id, day_number: 2)
td3 = Travelday.create(travelboard_id: costa1.id, day_number: 3)
td4 = Travelday.create(travelboard_id: costa1.id, day_number: 4)
td9 = Travelday.create(travelboard_id: costa2.id, day_number: 0)
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
fav12 = Favorite.create(experience_id: restaurant3.id, travelday_id: td0.id)
fav13 = Favorite.create(experience_id: activity1.id, travelday_id: td9.id)

puts "Favorites ok"
puts "creating chatroom"

chat1 = Chatroom.create(travelboard_id: costa1.id, name: "My travel in Costa Rica")
chat2 = Chatroom.create(travelboard_id: costa2.id, name: "Costa Rica 2019")

puts "Chatrooms ok"
puts "Finished"
