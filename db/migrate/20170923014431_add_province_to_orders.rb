class AddProvinceToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :province, index: true, foreign_key: true
  end
end
