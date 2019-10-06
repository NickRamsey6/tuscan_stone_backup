class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :store_id
      t.integer :product_id
      t.date :day

      t.timestamps
    end
  end
end
