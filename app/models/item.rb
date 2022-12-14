class Item < ApplicationRecord
  enum offer: [:no_offer, :buy_one_get_one_free, :three_for_two]

  validates :name, presence: true, length: { minimum: 3 }
  validates :price, numericality: { only_integer: true}
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  has_many :line_items, inverse_of: :item

  after_commit :check_low_stock

  def price_for(quantity)
    case offer
      when "no_offer"
        return price * quantity
      when "buy_one_get_one_free"
        return price * (quantity.to_f / 2).ceil
      when "three_for_two"
        adjusted_quantity = (((quantity/ 3).floor * 2) + (quantity % 3))
        return price * adjusted_quantity
      else
        throw new Error("Unknown offer")
    end
  end

  private

  LOW_STOCK_THRESHOLD = 5

  def check_low_stock
    if quantity < LOW_STOCK_THRESHOLD && quantity_was >= LOW_STOCK_THRESHOLD
      puts "Send email"
    end
  end
end
