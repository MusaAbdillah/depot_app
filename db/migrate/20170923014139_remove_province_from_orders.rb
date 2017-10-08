class RemoveProvinceFromOrders < ActiveRecord::Migration
  def change
    remove_reference :orders, :province, index: true, foreign_key: true
  end
end
