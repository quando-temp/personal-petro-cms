class CreatePetros < ActiveRecord::Migration[5.1]
  def change
    create_table :petros do |t|
      t.float :money
    	t.float :amount
    	t.integer :type_fuel
      t.float :price_fuel
      t.datetime :day_fuel
      t.belongs_to :customer

      t.timestamps
    end
  end
end
