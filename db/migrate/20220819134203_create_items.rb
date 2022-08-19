class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :quantity
      t.string :offer

      t.timestamps
    end
  end
end
