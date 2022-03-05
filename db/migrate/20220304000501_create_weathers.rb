class CreateWeathers < ActiveRecord::Migration[5.2]
  def change
    create_table :weathers do |t|
      t.date :date
      t.float :lat, precision: 4
      t.float :lon, precision: 4
      t.string :city
      t.string :state
      t.float :temperatures, array: true, default: []

      t.timestamps
    end
  end
end
