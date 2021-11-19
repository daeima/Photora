# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

puts "Cleaning database..."
Review.destroy_all
Booking.destroy_all
Venue.destroy_all
User.destroy_all


url = [
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637071218/venues/photo-1636138390540-de85ed519d40_tydinf.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637071192/venues/photo-1636392000614-d954d2fd833b_axdijg.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637071167/venues/photo-1636728797208-4ccf0ffe119c_uktmbi.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637071134/venues/photo-1636928837218-f2b56d5a7861_zwkcwa.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637255987/venues/photo-1636089650598-4825dcf551ef_lusnyy.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637255580/venues/photo-1636923611344-7c72724aa184_gbocl9.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637255117/venues/photo-1637052328057-8144abc05900_tlaij1.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637254689/venues/photo-1636965876984-103dcde1e0ba_rw4g15.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637254418/venues/photo-1637032194560-9c91d81f6bcb_nspgpc.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637262804/venues/photo-1634253539584-7259bef9fd3b_sjaudc.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637264023/venues/photo-1627925619389-0eebf6fab40a_aq3ugn.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637264108/venues/photo-1636124462194-dda51867beee_nwlv3d.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637264161/venues/photo-1636680463293-7d7a81e24799_aawuyx.jpg"
]

url2 = [
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637071112/venues/photo-1636714749996-fef3a3169478_ldt0tm.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637070998/venues/photo-1622763853951-ded5a33cb724_iml3wi.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637070843/venues/photo-1416331108676-a22ccb276e35_af8rvy.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637070795/venues/photo-1600585154363-67eb9e2e2099_ffchbc.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637070759/venues/photo-1512917774080-9991f1c4c750_oop0zg.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637255059/venues/photo-1636973879074-d5a518c242ea_qipskq.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637255465/venues/photo-1637075384325-36e6129446bf_cfp5se.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637255206/venues/photo-1637010111726-5a8bf4c6d8f5_vcjwjr.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637254996/venues/photo-1637170548426-d002d5661e86_xgruwa.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637262726/venues/photo-1631630259742-c0f0b17c6c10_tsezzj.jpg"

]

url3 =  [
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637255580/venues/photo-1636923611344-7c72724aa184_gbocl9.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637254996/venues/photo-1637170548426-d002d5661e86_xgruwa.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637254596/venues/photo-1636536621353-2a64208dc574_m5rfhq.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637255699/venues/photo-1636745261380-1fabc318ac55_wdyhiq.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637262424/venues/photo-1551516594-56cb78394645_uavcpp.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637262445/venues/photo-1571247865791-9d7ed2ddf033_mh7sqr.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637255262/venues/photo-1637207947587-3065d13a3fa1_veg7tv.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637262830/venues/photo-1537959993072-251775ad9cd3_ilwl7m.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637263998/venues/photo-1628624998771-ed120a552e74_a4uqgb.jpg",
  "https://res.cloudinary.com/dhdgr3c0l/image/upload/v1637263958/venues/photo-1614230320098-b8b25859ebfe_txhcaq.jpg"
]

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

names = [
  "Buenas Noches - The Haven", "Native Bankside", "City Centre View Studio", "Bright & Modern Kings Cross ",
  "The Lincoln Suite", "Fabulously modern", "Cozy Studio Flat in Ladbroke Grove", "Modern apartment in Hoxton",
  "Marvellous Notting Hill", "Roomzzz London Stratford", "Native Hyde Park", "Rockwell East-Tower Bridge",
  "Studio2Let", "Paddington Marble Arch 4", "Cove Landmark Pinnacle", "Kingsland Locke "
]

descriptions = [
  "Bright, airy, 1st/top floor studio flat with outdoor seated balcony. Central but peaceful as it is set back from the main road",
  "Our Golden Square studio apartments provide unbeatable location and quality in central London.",
  "Offering stylish accommodation with free WiFi, Leman Locke is located in Shoreditch, London, 900 m from both the Tower of London and Brick Lane",
  "The accommodation has city views, a dining area and seating area with bespoke furniture",
  "Right in the heart of London with amazing access to all the popular London sites such as Big Ben, Buckingham Palace and Oxford Circus.",
  "Popular points of interest near The Lincoln Suites include Royal Opera House, Lyceum Theatre and Covent Garden. The nearest airport is London City Airport, 12 km from the accommodation",
  "You will first discover a living room with an open kitchen. You’ll be happy to find a kitchen bar for two people to dine",
  "A well furnished one bedroom apartment conveniently tucked away in the City of London offering you a good comfy nest to explore London or a place to rest after a business meeting",
  "A lovely summer feel for this spacious garden Venue. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory",
  "Lovely warm comfortable and stylishly furnished house. Private bedroom and bathroom with shared living areas",
  "A mini apartment within the clock tower apartment at St Pancras Station, with its own en suite bathroom and kitchen and sitting area"
]

locations = [
  "153 -157 Tower Bridge Road Southwark, Southwark, London, SE1 3LW",
  "1-2 Bear Gardens, Southwark, London, SE1 9ED",
  "15 Leman Street, Tower Hamlets, London, E1 8EN",
  "37-39 Kingsway, Westminster Borough, London, WC2B 6TP",
  "124 Bethnal Green Road, Tower Hamlets, London, E2 6DG",
  "46 Cannon Street, London, City of London, London, EC4N 6JJ",
  "18-21 Northumberland Ave, Westminster Borough, London, WC2N 5EA",
  "66 West Ham Lane, Newham, London, E15 4PT",
  "Park West Place, Westminster Borough, London, W2 2QL",
  "15 Westferry Road, Tower Hamlets, London, E14 8JH",
  "130 Kingsland High Street, Hackney, London, E8 2LQ"
]

good_reviews = [
  "Great location and fun atmosphere!",
  "Good spot!",
  "Excelent natural light",
  "Perfect for night shoots",
  "Gorgeaus landscape",
  "100% recomand!Will book again for sure!",
  "Perfect for romantic photoshoots",
  "Great place for good price",
  "Cannot say enough good things about this venue",
  "Simply gorgeaus",
  "The place was just as the description"
]

bad_reviews = [
  "A bit to tiny",
  "Not engnough natural light",
  "To expensive",
  "Unclean",
  "The view was not as advertised",
]

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

9.times do
  Venue.create!(
    name: names.sample,
    location: locations.sample,
    description: descriptions.sample,
    price: rand(65..120),
    user: [u1, u2].sample
  )
end

puts "Finished creating venues"

puts "Creating bookings"

20.times do
  Booking.create!(
    start_time: "2020-06-14 18:00:00",
    end_time: "2020-06-14 18:00:00",
    total_price: rand(50..200),
    user: [u1, u2].sample,
    venue: Venue.all.sample
  )
end

puts "Bookings done"

puts "Creating reviews"

20.times do
  Review.create!(
    content: good_reviews.sample,
    rating: rand(3..5),
    booking: Booking.all.sample
  )
end

10.times do
  Review.create!(
    content: bad_reviews.sample,
    rating: rand(3..5),
    booking: Booking.all.sample
  )
end

puts "Finished creating reviews"

puts "Adding photos"

Venue.all.each do |venue|
  photo = URI.open(url.pop)
  venue.photos.attach(io: photo, filename: 'venue.png', content_type: 'image/png')
end

Venue.all.each do |venue|
  photo = URI.open(url2.sample)
  venue.photos.attach(io: photo, filename: 'venue.png', content_type: 'image/png')
end

Venue.all.each do |venue|
  photo = URI.open(url3.sample)
  venue.photos.attach(io: photo, filename: 'venue.png', content_type: 'image/png')
end

puts "Finished adding photos. Database complete"
