class CreateEmployeeUins < ActiveRecord::Migration[5.2]
  def change
    create_table :employee_uins, :id => false do |t|
      t.integer :id
      t.integer :uin

      t.timestamps
    end
  end
end
