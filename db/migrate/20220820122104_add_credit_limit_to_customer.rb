class AddCreditLimitToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :credit_limit, :integer
  end
end
