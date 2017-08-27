class ChangeColumnToNewFromOrders < ActiveRecord::Migration
  change_table :orders do |t|
  		t.change :phone, :string
  end
end
