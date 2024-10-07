class Order < ApplicationRecord
  belongs_to :user
  belongs_to :table
  has_and_belongs_to_many :dishes, dependent: :destroy

  validates :table_id, presence: { message: "Il tavolo è obbligatorio" }
  validate :table_must_be_available

  private 

  def table_must_be_available
    if table.present? && !table.available? && table != previous_table
      errors.add(:table, "Attenzione, il tavolo non è disponibile")
    end
  end

  def previous_table
    persisted? ? Order.find(id).table : nil
  end
end
