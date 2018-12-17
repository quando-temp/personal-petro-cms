class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
    	t.string :phone
    	t.string :gender
      t.string :address
      t.string :department
      t.string :position
      t.float :salary
      

      t.timestamps
    end
  end
end
