class CreateCalltimes < ActiveRecord::Migration[5.1]
  def change
    create_table :calltimes do |t|
      t.string :notice
      t.string :result
      t.belongs_to :petro

      t.timestamps
    end
  end
end
