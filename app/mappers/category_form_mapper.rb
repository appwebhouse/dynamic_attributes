class CategoryFormMapper
  def self.map(category_form, object)
    return unless object.instance_of? Category

    object.name = category_form.name
    object.parent_id = category_form.parent_id

    object.properties = category_form.properties.map do |property|
      [property.name, { type: property.type }]
    end.to_h

    object
  end
end
