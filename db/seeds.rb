user_1 = User.find_by_email('rahul.kr.das.27@gmail.com') || User.create!(name: 'Rahul Kumar Das',email: 'rahul.kr.das.27@gmail.com', password: 'poiuytrewq', password_confirmation: 'poiuytrewq')

salt_lake = Place.find_or_create_by!(name: "Salt Lake", latitude: 22.5797, longitude: 88.4143, user_id: user_1.id)
howrah = Place.find_or_create_by!(name: "Howrah", latitude: 22.595770, longitude: 88.263641, user_id: user_1.id)
dum_dum = Place.find_or_create_by!(name: "Dum Dum", latitude: 22.6420, longitude: 88.4312, user_id: user_1.id)

user_2 = User.find_by_email('janelle+santiago@becker.com') || User.create!(name: 'janelle santiago', email: 'janelle+santiago@becker.com', password: 'poiuytrewq', password_confirmation: 'poiuytrewq')

newtown = Place.find_or_create_by!(name: "Newtown", latitude: 22.5754, longitude: 88.4798, user_id: user_2.id)
serampore = Place.find_or_create_by!(name: "Serampore", latitude: 22.7505, longitude: 88.3406, user_id: user_2.id)
uluberia = Place.find_or_create_by!(name: "Uluberia", latitude: 22.4764, longitude: 88.0898, user_id: user_2.id)

# user_1 shared location salt_lake with user_2; user_2 shared location newtown with user_1
Share.create!([
  { user_id: user_1.id, place_id: newtown.id },
  { user_id: user_2.id, place_id: salt_lake.id }
])
