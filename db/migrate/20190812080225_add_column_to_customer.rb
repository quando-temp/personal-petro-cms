class AddColumnToCustomer < ActiveRecord::Migration[5.1]
  def change
    add_column :customers, :last_date_petro, :datetime
  end
end
