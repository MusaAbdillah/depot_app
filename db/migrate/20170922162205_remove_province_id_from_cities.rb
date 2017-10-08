class RemoveProvinceIdFromCities < ActiveRecord::Migration
  def change
    remove_column :cities, :province_id, :integer
  end
end
