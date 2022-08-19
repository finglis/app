class LineItemsNullable < ActiveRecord::Migration[7.0]
  def change
    change_column_null :sales, :line_items_id, true
  end
end
