class AddPosCodeToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :pos_code, :string
  end
end
