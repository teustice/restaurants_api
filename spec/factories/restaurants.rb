FactoryGirl.define do
  factory :restaurant do
    name Faker::Lorem.word
    category Faker::Lorem.word
    address Faker::Lorem.sentence(5, false, 0).chop
    price_range "Under $10"
  end
end
