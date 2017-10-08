class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :provinces, :province, :province_name
  	rename_column :cities, :province, :province_name
  end
end
