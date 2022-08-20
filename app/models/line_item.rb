class LineItem < ApplicationRecord
    belongs_to :sale, inverse_of: :line_items
    belongs_to :item, inverse_of: :line_items

    before_create :update_stock
    before_destroy :free_stock
    before_validation :set_price

    def set_price
        self.total_price_at_sale_time = item.price_for quantity
    end

    def update_stock
        got_stock = false
        item.with_lock do
            item.quantity -= quantity
            got_stock = item.save
        end
        return if got_stock

        errors.add(:quantity, "Couldnt reserve sufficent stock")
        raise ActiveRecord::RecordInvalid.new(self)
    end

    def free_stock
        item.with_lock do
            item.quantity += quantity
            item.save!
        end
    end
end
