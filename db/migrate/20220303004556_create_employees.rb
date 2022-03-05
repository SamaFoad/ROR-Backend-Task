class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees, :id => false do |t|
      t.integer :id
      t.string :name, limit: 20
      t.integer :age
      t.string :address, limit: 25
      t.integer :salary

      t.timestamps
    end
  end
end
