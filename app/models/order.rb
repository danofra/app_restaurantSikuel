class Order < ApplicationRecord
  belongs_to :table

  has_many :order_dishes
  has_many :dishes, through: :order_dishes
end
