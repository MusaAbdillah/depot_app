class RemoveProvinceIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :province_id, :integer
  end
end
