class Seed

  def self.begin
    seed = Seed.new
    seed.generate_restaurants
  end

  def generate_restaurants
    categories = ['Sushi', 'American', 'Korean bbq', 'Hot Pot', 'Pub Food', 'Vegan', 'Mexican']
    50.times do |i|
      Restaurant.create!(
        name: Faker::Company.name,
        category: categories.sample,
        address: Faker::Address.street_address,
        price_range: rand(10...30))
    end
    p "added #{Restaurant.count} restaurants"
  end
end

Seed.begin
