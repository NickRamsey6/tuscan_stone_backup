class CreateTimecards < ActiveRecord::Migration[5.2]
  def change
    create_table :timecards do |t|
      t.date :day
      t.integer :store_id
      t.integer :employee_id
      t.decimal :hours

      t.timestamps
    end
  end
end
