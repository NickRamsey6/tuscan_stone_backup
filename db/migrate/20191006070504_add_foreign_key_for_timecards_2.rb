class AddForeignKeyForTimecards2 < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :timecards, :employees
  end
end
