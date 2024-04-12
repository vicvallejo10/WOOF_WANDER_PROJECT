# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
Review.destroy_all
Place.destroy_all
Pet.destroy_all
List.destroy_all
User.destroy_all

puts "Creating users..."
victoria = {
  email: "victoria@mail.com",
  password: "hello1234",
  first_name: "Victoria",
  last_name: "Vallejo"
}

victoria = User.create!(victoria)

charm = {
  email: "charm@mail.com",
  password: "hello1234",
  first_name: "Charmaine",
  last_name: "Ramos"
}

charm = User.create!(charm)

puts "Creating pets..."
freyja = {
  pet_name: "Freyja",
  birthdate: "21/03/2016",
  microchip_number: "900215004589434",
  breed: "Mix",
  size: "Big",
  color: "White with gray",
  sterilized: true,
  vaccine_card: "Last vaccine applied on 2023",
  user: victoria
}

malone = {
  pet_name: "Malone",
  birthdate: "18/10/2018",
  microchip_number: "900215004589435",
  breed: "Pomeranian",
  size: "Small",
  color: "Brown",
  sterilized: false,
  vaccine_card: "Last vaccine applied on 2024",
  user: charm
}

drake = {
  pet_name: "Drake",
  birthdate: "21/01/2019",
  microchip_number: "900215004589436",
  breed: "Siberian Husky",
  size: "Big",
  color: "Gray and White",
  sterilized: false,
  vaccine_card: "Last vaccine applied on 2024",
  user: charm
}

[freyja, malone, drake].each do |attributes|
  pet = Pet.create!(attributes)
  puts "Created #{pet.pet_name}"
end

puts "Creating places..."

place1 = {
  place_name: "Jardin du Luxembourg",
  place_description: "Beautiful public park with lush greenery, statues, and fountains.",
  place_type: "Park",
  address: "Rue de Médicis, 75006 Paris, France",
  city: "Paris",
  country: "France",
  zip_code: "75006",
  longitude: 2.3375,
  latitude: 48.8465,
  tag_offleash: false,
  tag_wateraccess: false,
  tag_outdoor: true,
  tag_indoor: false,
  tag_smallpet: true,
  tag_mediumpet: true,
  tag_largepet: true,
  tag_disposalstation: true
}

place2 = {
  place_name: "Le Café des Chats",
  place_description: "Cozy café where guests can enjoy drinks and snacks in the company of resident cats.",
  place_type: "Cafe",
  address: "16 Rue Michel le Comte, 75003 Paris, France",
  city: "Paris",
  country: "France",
  zip_code: "75003",
  longitude: 2.3592,
  latitude: 48.8634,
  tag_offleash: false,
  tag_wateraccess: false,
  tag_outdoor: false,
  tag_indoor: true,
  tag_smallpet: true,
  tag_mediumpet: false,
  tag_largepet: false,
  tag_disposalstation: false
}

place4 = {
  place_name: "Bois de Vincennes",
  place_description: "Large public park offering walking paths, lakes, and picnic areas.",
  place_type: "Park",
  address: "Route de la Pyramide, 75012 Paris, France",
  city: "Paris",
  country: "France",
  zip_code: "75012",
  longitude: 2.4239,
  latitude: 48.8199,
  tag_offleash: true,
  tag_wateraccess: true,
  tag_outdoor: true,
  tag_indoor: false,
  tag_smallpet: true,
  tag_mediumpet: true,
  tag_largepet: true,
  tag_disposalstation: true
}

place3 = {
  place_name: "Parc des Buttes-Chaumont",
  place_description: "Picturesque park featuring a lake, waterfalls, and scenic viewpoints.",
  place_type: "Park",
  address: "1 Rue Botzaris, 75019 Paris, France",
  city: "Paris",
  country: "France",
  zip_code: "75019",
  longitude: 2.3811,
  latitude: 48.8786,
  tag_offleash: true,
  tag_wateraccess: false,
  tag_outdoor: true,
  tag_indoor: false,
  tag_smallpet: true,
  tag_mediumpet: true,
  tag_largepet: true,
  tag_disposalstation: true
}

place5 = {
  place_name: "La Bauhinia",
  place_description: "Elegant restaurant located within the Shangri-La Hotel offering French and Asian cuisine.",
  place_type: "Restaurant",
  address: "10 Avenue d'Iéna, 75116 Paris, France",
  city: "Paris",
  country: "France",
  zip_code: "75116",
  longitude: 2.2938,
  latitude: 48.8634,
  tag_offleash: false,
  tag_wateraccess: false,
  tag_outdoor: false,
  tag_indoor: true,
  tag_smallpet: true,
  tag_mediumpet: true,
  tag_largepet: true,
  tag_disposalstation: false
}

[place1, place2, place3, place4, place5].each do |attributes|
  place = Place.create!(attributes)
  puts "Created #{place.place_name}"
end
