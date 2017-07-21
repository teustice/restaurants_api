class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.column :name, :string
      t.column :category, :string
      t.column :address, :string
      t.column :price_range, :string
      t.timestamps
    end
  end
end
