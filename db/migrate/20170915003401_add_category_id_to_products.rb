class AddCategoryIdToProducts < ActiveRecord::Migration
  def change
    add_reference :products, :category_id, index: true, foreign_key: true
  end
end
