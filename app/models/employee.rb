class Employee < ApplicationRecord
  belongs_to :store
  has_many :timecards

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Employee.create! row.to_hash
    end
  end
end
