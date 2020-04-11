# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
british = User.find_by_email('rahul.kr.das.27@gmail.com') || User.create!(email: 'rahul.kr.das.27@gmail.com', password: 'poiuytrewq', password_confirmation: 'poiuytrewq')
Place.create!([
  { name: "Buckingham Palace", latitude: "51.501564", longitude: "-0.141944", user_id: british.id},
  { name: "Westminster Abbey", latitude: "51.499581", longitude: "-0.127309", user_id: british.id},
  { name: "Big Ben", latitude: "51.500792", longitude: "-0.124613", user_id: british.id}
])

indian = User.find_by_email('rahul.kr.das.27+indian@gmail.com') || User.create!(email: 'rahul.kr.das.27+indian@gmail.com', password: 'poiuytrewq', password_confirmation: 'poiuytrewq')
Place.create!([
  { name: "Delhi", latitude: "28.7041", longitude: "77.1025", user_id: indian.id},
  { name: "Noida", latitude: "28.5355", longitude: "77.3910", user_id: indian.id},
  { name: "Gurugram", latitude: "28.4595", longitude: "77.0266", user_id: indian.id}
])
