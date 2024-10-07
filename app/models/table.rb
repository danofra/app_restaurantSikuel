class Table < ApplicationRecord
    belongs_to :user
    has_many :order_tables, dependent: :destroy
    has_many :orders, through: :order_tables, dependent: :destroy
    validates :number, presence: { message: "Il numero del tavolo è obbligatorio" },
                       uniqueness: {scope: :user_id, message: "Il numero del tavolo esiste già" },
                       numericality: { greater_than: 0, message: "Il numero del tavolo deve essere maggiore di 0" }
end
