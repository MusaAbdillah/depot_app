class RemoveCityIdFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :city_id, :integer
  end
end
