class Ingredient < ApplicationRecord
    belongs_to :user
    has_many :dish_ingredients, dependent: :destroy
    has_many :dishes, through: :dish_ingredients, dependent: :destroy
    validates :name, presence: { message: "Il nome dell'ingrediente è obbligatorio" },
                     uniqueness: {scope: :user_id, message: "Questo ingrediente esiste già" }
    validates :stock, numericality: { greater_than_or_equal_to: 0, message: "Lo giacenza deve essere maggiore o uguale a 0" }
end
