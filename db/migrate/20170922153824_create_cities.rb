class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.integer :province_id
      t.string :province
      t.string :type
      t.string :city_name
      t.string :postal_code

      t.timestamps null: false
    end
  end
end
