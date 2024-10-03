class Dish < ApplicationRecord
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients
  
  has_many :order_dishes
  has_many :orders, through: :order_dishes
end
