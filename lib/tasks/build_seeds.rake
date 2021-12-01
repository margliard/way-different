task build_seeds: :environment do
  puts 'test'
  doc = Nokogiri::HTML(URI.open("https://www.ethik-hotels.com/en/infrance"))
  browser = Ferrum::Browser.new
  hotels = []
  doc.search('.post').each do |element|
    # Experience name
    title = element.search('.entry-title-post').text.strip
    # Experience description
    description = element.search('.entry-content-post p').text.strip
    # Experience photo
    link_show = element.search('.more-link').attribute('href')
    link_show_content = Nokogiri::HTML(URI.open(link_show))
    image = link_show_content.search('a .attachment-post-thumbnail').attribute('data-jpibfi-src').value
    # Experience addresse
    link_show2 = element.search('.more-link').attribute('href').value
    browser.go_to(link_show2)
    address = browser.at_css(".leaflet-popup-content").text
    # Experience criterias
    criteria = element.search('.critereValide span').text.gsub('Criterion respected:', ' ').strip.split(/(?=[A-Z])/).collect(&:strip)
    # Create a hotel
    hotel = {category: "Accommodation", name: "#{title}", address: "#{address}", availability: true, price: nil, country: "france", city: " ", description: "#{description}", booked: false, image_url: "#{image}"}
    puts "One hotel created, please wait!"
    hotel
    hotels << hotel
  end
  browser.quit
  File.write('db/hotels.json', JSON.dump(hotels))
end
