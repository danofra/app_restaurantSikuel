class Table < ApplicationRecord
    has_many :order_tables
    has_many :orders, through: :order_tables
    validates :number, presence: { message: "Il numero del tavolo è obbligatorio" },
                       uniqueness: { message: "Il numero del tavolo esiste già" },
                       numericality: { greater_than: 0, message: "Il numero del tavolo deve essere maggiore di 0" }
end
