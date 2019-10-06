class AddForeignKeyForOrders2 < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :orders, :products
  end
end
