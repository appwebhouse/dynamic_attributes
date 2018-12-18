class ProductPropertyForm < ApplicationForm
  attribute :name, :string
  attribute :value, :string

  validates :name, presence: true
end
