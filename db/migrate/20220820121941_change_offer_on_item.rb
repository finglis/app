class ChangeOfferOnItem < ActiveRecord::Migration[7.0]
  def change
    change_column :items, :offer, :integer, default: 0
  end
end
