user_1 = User.find_by_email('rahul.kr.das.27@gmail.com') || User.create!(email: 'rahul.kr.das.27@gmail.com', password: 'poiuytrewq', password_confirmation: 'poiuytrewq')
Place.create!([
  { name: "Salt Lake", latitude: 22.5797, longitude: 88.4143, user_id: user_1.id},
  { name: "Howrah", latitude: 22.595770, longitude: 88.263641, user_id: user_1.id},
  { name: "Dum Dum", latitude: 22.6420, longitude: 88.4312, user_id: user_1.id}
])

user_2 = User.find_by_email('rahul.kr.das.27+indian@gmail.com') || User.create!(email: 'rahul.kr.das.27+indian@gmail.com', password: 'poiuytrewq', password_confirmation: 'poiuytrewq')
Place.create!([
  { name: "Newtown", latitude: 22.5754, longitude: 88.4798, user_id: user_2.id},
  { name: "Serampore", latitude: 22.7505, longitude: 88.3406, user_id: user_2.id},
  { name: "Uluberia", latitude: 22.4764, longitude: 88.0898, user_id: user_2.id}
])
