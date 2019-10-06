class Product < ApplicationRecord
  has_many :orders

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      product = find_by_id(row["id"]) || new
      product.attributes = row.to_hash
      product.save!
    end
  end
end
