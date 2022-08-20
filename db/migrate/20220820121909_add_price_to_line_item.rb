class AddPriceToLineItem < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :total_price_at_sale_time, :integer, null: false
  end
end
