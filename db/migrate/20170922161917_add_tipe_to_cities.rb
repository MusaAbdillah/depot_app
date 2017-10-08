class AddTipeToCities < ActiveRecord::Migration
  def change
    add_column :cities, :tipe, :string
  end
end
