class Dish < ApplicationRecord
  has_many :dish_ingredients
  has_many :ingredients, through: :dish_ingredients
  has_and_belongs_to_many :orders

  validates :name, presence: { message: "Il nome della portata è obbligatorio" },
                   uniqueness: { message: "Questo portata esiste già" }
  
  validate :must_have_at_least_one_ingredient

  private

  def must_have_at_least_one_ingredient
    if ingredients.empty?
      errors.add(:ingredients, "deve contenere almeno un ingrediente")
    end
  end
end


