require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { should validate_presence_of :name }
  it { should validate_presence_of :category }
  it { should validate_presence_of :price_range }
  it { should validate_presence_of :address }
end
