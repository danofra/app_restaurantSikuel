class Order < ApplicationRecord
  belongs_to :table
  validate :table_must_be_available

  has_and_belongs_to_many :dishes

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
