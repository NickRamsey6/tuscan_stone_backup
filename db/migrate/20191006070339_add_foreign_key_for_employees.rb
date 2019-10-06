class AddForeignKeyForEmployees < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :employees, :stores
  end
end
