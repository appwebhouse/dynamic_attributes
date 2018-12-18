class CategoryMapper
  def self.map(category, object)
    return unless object.instance_of? CategoryForm

    object.name = category.name
    object.parent_id = category.parent_id

    object.properties = category.properties.map do |k, v|
      CategoryPropertyForm.new(name: k, type: v['type'])
    end

    object
  end
end
