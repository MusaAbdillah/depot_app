class RemoveTypeFromCities < ActiveRecord::Migration
  def change
    remove_column :cities, :type, :string
  end
end
