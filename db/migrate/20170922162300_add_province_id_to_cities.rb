class AddProvinceIdToCities < ActiveRecord::Migration
  def change
    add_reference :cities, :province_id, index: true, foreign_key: true
  end
end
