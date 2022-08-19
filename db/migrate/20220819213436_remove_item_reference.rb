class RemoveItemReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :sales, :item
  end
end
