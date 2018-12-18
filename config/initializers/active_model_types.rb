class PropertyFormsType < ActiveModel::Type::Value
  def cast(value)
    if value.is_a? Array
      result = Array.new(value.reject { |c| c.blank? })

      result.map! do |attributes|

        if attributes.respond_to?(:to_h)
          PropertyForm.new(attributes)
        else
          attributes
        end
      end

      super result
    elsif value.respond_to?(:to_h)
      value.values.map! do |attributes|
        PropertyForm.new(attributes)
      end
    else
      super value
    end
  end
end

ActiveModel::Type.register(:property_forms, PropertyFormsType)
