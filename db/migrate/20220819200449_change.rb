class Change < ActiveRecord::Migration[7.0]
  def change
    remove_column :sales, :item
  end
end
