class Restaurant < ApplicationRecord
  validates_presence_of :name, :category, :price_range, :address
end
