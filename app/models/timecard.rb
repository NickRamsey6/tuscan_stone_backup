class Timecard < ApplicationRecord
  belongs_to :store
  belongs_to :employee

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Timecard.create! row.to_hash
    end
  end
end
