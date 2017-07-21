class Restaurant < ApplicationRecord
  validates_presence_of :name, :category, :price_range, :address

  def self.search(params)
    results = []
    if Restaurant.param_check(params)
      if params[:name]
        results = Restaurant.find_by_name(params[:name])
      elsif params[:category]
        results = Restaurant.find_by_category(params[:category])
      elsif params[:price_range]
        results = Restaurant.find_by_price_range(params[:price_range])
      end
    else
      results = false
    end
    results
  end

  # verifies only one param is passed
  def self.param_check(params)
     !(params[:name] && params[:category] || params[:name] && params[:price_range] || params[:category] && params[:price_range])
  end


  # search filters
  scope :find_by_name, ->(inputted_name) { where("name = ?", inputted_name) }
  scope :find_by_category, ->(inputted_category) { where("category = ?", inputted_category) }
  scope :find_by_price_range, ->(inputted_range) { where("price_range < ?", inputted_range) }
end
