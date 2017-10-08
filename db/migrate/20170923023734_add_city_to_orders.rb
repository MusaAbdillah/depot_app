class AddCityToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :city, index: true, foreign_key: true
  end
end
