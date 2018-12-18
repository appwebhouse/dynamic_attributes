class Category < ApplicationRecord
  has_ancestry

  validates :name, presence: true, length: { minimum: 2 }
end
