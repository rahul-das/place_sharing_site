FactoryBot.define do
  factory :place do
    name { Faker::Address.street_name }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    is_public { true }
    user_id { 1 }
  end
  
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { SecureRandom.hex }
  end
  
  factory :share do
    place_id { 1 }
    user_id { 1 }
  end
end
