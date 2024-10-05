class Ingredient < ApplicationRecord
    has_many :dish_ingredients
    has_many :dishes, through: :dish_ingredients
    validates :name, presence: { message: "Il nome dell'ingrediente è obbligatorio" },
                     uniqueness: { message: "Questo ingrediente esiste già" }
    validates :stock, numericality: { greater_than_or_equal_to: 0, message: "Lo giacenza deve essere maggiore o uguale a 0" }

end
