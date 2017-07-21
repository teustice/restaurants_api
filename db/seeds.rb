class Seed

  def self.begin
    seed = Seed.new
    seed.generate_restaurants
  end

  def generate_restaurants
    50.times do |i|
      Restaurant.create!(
        name: Faker::Lorem.word,
        category: Faker::Lorem.word,
        address: Faker::Lorem.sentence(5, false, 0).chop,
        price_range: "Under $#{rand(10...30)}")
    end
    p "added #{Restaurant.count} restaurants"
  end
end

Seed.begin
