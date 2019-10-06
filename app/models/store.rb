class Store < ApplicationRecord
  has_many :employees
  has_many :timecards
  has_many :orders

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Store.create! row.to_hash
    end
  end
end
