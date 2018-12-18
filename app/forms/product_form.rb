class ProductForm < ApplicationForm
  attribute :name, :string
  attribute :category_id, :integer
  attribute :properties, :product_property_forms, default: ->{ Array.new }

  validates :name, :category_id, presence: true
  validate :properties_validation

  private
    def properties_validation
      self.properties.each { |e| e.valid? }

      if self.properties.any? { |property| property.errors.any? }
        errors.add(:properties, :invalid)
      end
    end
end
