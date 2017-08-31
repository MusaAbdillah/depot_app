class RemoveUserFromCarts < ActiveRecord::Migration
  def change
    remove_reference :carts, :user, index: true, foreign_key: true
  end
end
