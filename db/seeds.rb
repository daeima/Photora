# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning database..."
Venue.destroy_all
User.destroy_all

url = ["https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637071218/venues/photo-1636138390540-de85ed519d40_tydinf.jpg",
       "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637071192/venues/photo-1636392000614-d954d2fd833b_axdijg.jpg",
       "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637071167/venues/photo-1636728797208-4ccf0ffe119c_uktmbi.jpg"]


puts "Creating users"

u1 = User.create!(
  email: "user@user.com",
  password: "password",
  first_name: "First",
  last_name: "User",
  owner: true
)

u2 = User.create!(
  email: "user2@user.com",
  password: "password",
  first_name: "Second",
  last_name: "User",
  owner: true
)
puts "Finished!"

puts "Creating venues"

Venue.create!(
  name: 'Light & Spacious Garden Venue London',
  location: '10 Clifton Gardens London W9 1DT',
  description: 'A lovely summer feel for this spacious garden Venue. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price: 75,
  user: [u1, u2].sample
)

Venue.create!(
  name: 'Stylish House Close to River Thames',
  location: '5 Queensmill Road London SW6 6JP',
  description: 'Lovely warm comfortable and stylishly furnished house. Private bedroom and bathroom with shared living areas.',
  price: 65,
  user: [u1, u2].sample
)

Venue.create!(
  name: 'St Pancras Clock Tower Guest Suite',
  location: 'Euston Rd London N1C 4QP',
  description: 'A mini apartment within the clock tower apartment at St Pancras Station, with its own en suite bathroom and kitchen and sitting area.',
  price: 110,
  user: [u1, u2].sample
)

Venue.all.each do |venue|
  photo = URI.open(url.sample)
  venue.photos.attach(io: photo, filename: 'venue.png', content_type: 'image/png')
end

puts "Finished!"
