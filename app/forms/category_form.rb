class CategoryForm < ApplicationForm
  attribute :name, :string
  attribute :parent_id, :integer
  attribute :properties, :property_forms, default: ->{ Array.new }

  validates :name, presence: true
  validate :properties_validation

  private
    def properties_validation
      self.properties.each { |e| e.valid? }

      if self.properties.any? { |property| property.errors.any? }
        errors.add(:properties, :invalid)
      end
    end
end
