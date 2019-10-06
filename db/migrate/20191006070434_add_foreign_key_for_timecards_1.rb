class AddForeignKeyForTimecards1 < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :timecards, :stores
  end
end
