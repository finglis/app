class LineItem < ApplicationRecord
    belongs_to :sale, inverse_of: :line_items
    has_one :item
end