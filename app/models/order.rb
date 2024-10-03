class Order < ApplicationRecord
  belongs_to :table

  has_and_belongs_to_many :dishes
end
