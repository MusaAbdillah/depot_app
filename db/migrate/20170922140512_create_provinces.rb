class CreateProvinces < ActiveRecord::Migration
  def change
    create_table :provinces do |t|
      t.string :province

      t.timestamps null: false
    end
  end
end
