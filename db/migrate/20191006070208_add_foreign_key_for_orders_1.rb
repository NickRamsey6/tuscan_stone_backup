class AddForeignKeyForOrders1 < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :orders, :stores
  end
end
