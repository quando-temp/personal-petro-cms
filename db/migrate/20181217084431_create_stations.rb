class CreateStations < ActiveRecord::Migration[5.1]
  def change
    create_table :stations do |t|
      t.string :logo
      t.string :name
      t.string :address
      t.string :hotline

      t.belongs_to :admin

      t.timestamps
    end
  end
end
