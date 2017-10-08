class RemoveProvinceIdIdFromCities < ActiveRecord::Migration
  def change
    remove_column :cities, :province_id_id, :integer
  end
end
