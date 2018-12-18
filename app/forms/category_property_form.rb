class CategoryPropertyForm < ApplicationForm
  PROPERTY_TYPES = ['string', 'integer', 'decimal', 'boolean']

  attribute :name, :string
  attribute :type, :string

  validates :name, presence: true
  validates :type, presence: true, inclusion: { in: PROPERTY_TYPES }
end
