class CategoryPropertyFormsType < ActiveModel::Type::Value
  def cast(value)
    if value.is_a? Array
      result = Array.new(value.reject { |c| c.blank? })

      result.map! do |attributes|
        if attributes.respond_to?(:to_h)
          CategoryPropertyForm.new(attributes)
        else
          attributes
        end
      end

      super result
    elsif value.respond_to?(:to_h)
      value.values.map! do |attributes|
        CategoryPropertyForm.new(attributes)
      end
    else
      super value
    end
  end
end

ActiveModel::Type.register(:category_property_forms, CategoryPropertyFormsType)

class ProductPropertyFormsType < ActiveModel::Type::Value
  def cast(value)
    if value.is_a? Array
      result = Array.new(value.reject { |c| c.blank? })

      result.map! do |attributes|
        if attributes.respond_to?(:to_h)
          ProductPropertyForm.new(attributes)
        else
          attributes
        end
      end

      super result
    elsif value.respond_to?(:to_h)
      value.values.map! do |attributes|
        ProductPropertyForm.new(attributes)
      end
    else
      super value
    end
  end
end

ActiveModel::Type.register(:product_property_forms, ProductPropertyFormsType)
