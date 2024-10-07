class Dish < ApplicationRecord
  belongs_to :user
  has_many :dish_ingredients, dependent: :destroy
  has_many :ingredients, through: :dish_ingredients, dependent: :destroy
  has_and_belongs_to_many :orders, dependent: :destroy

  validates :name, presence: { message: "Il nome della portata è obbligatorio" },
                   uniqueness: {scope: :user_id, message: "Questo portata esiste già" }
  
  validate :must_have_at_least_one_ingredient

  private

  def must_have_at_least_one_ingredient
    if ingredients.empty?
      errors.add(:ingredients, "deve contenere almeno un ingrediente")
    end
  end
end


