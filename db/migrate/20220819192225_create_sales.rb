class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.belongs_to :customer, null: false, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
