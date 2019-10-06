class Order < ApplicationRecord
  belongs_to :store
  belongs_to :product

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Order.create! row.to_hash
    end
  end
end
