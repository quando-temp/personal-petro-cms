class CreateCustomers < ActiveRecord::Migration[5.1]
  def change
    create_table :customers do |t|
      t.string :name
    	t.string :phone
    	t.string :car_number
    	t.string :company
      t.integer :type_customer

      t.timestamps
    end
  end
end
