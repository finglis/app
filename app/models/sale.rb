class Sale < ApplicationRecord
  belongs_to :customer
  has_many :line_items
  has_one :store

  accepts_nested_attributes_for :line_items
end
