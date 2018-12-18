class ProductMapper
  def self.map(product, object)
    return unless object.instance_of? ProductForm

    object.name = product.name
    object.category_id = product.category_id

    object
  end
end
