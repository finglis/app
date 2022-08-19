class Item < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :price, numericality: { only_integer: true}
  validates :quantity, numericality: { only_integer: true}
  validates :offer, presence: true
end
