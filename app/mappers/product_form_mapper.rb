class ProductFormMapper
  def self.map(product_form, object)
    return unless object.instance_of? Product

    object.name = product_form.name
    object.category_id = product_form.category_id

    object
  end
end
