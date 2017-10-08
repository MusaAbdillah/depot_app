class RemoveCategoryIdIdFromProducts < ActiveRecord::Migration
  def change
    remove_reference :products, :category_id_id, index: true, foreign_key: true
  end
end
