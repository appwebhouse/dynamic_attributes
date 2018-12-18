class Admin::ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.order(id: :asc)
  end

  def show; end

  def new
    @product_form = ProductForm.new
  end

  def edit
    @product_form = ProductMapper.map(@product, ProductForm.new)
  end

  def create
    @product_form = ProductForm.new(product_form_params)

    return render :new unless @product_form.valid?

    ProductFormMapper.map(@product_form, Product.new).save!

    redirect_to admin_products_path,
      notice: 'Product was successfully created.'
  end

  def update
    @product_form = ProductForm.new(product_form_params)

    return render :edit unless @product_form.valid?

    ProductFormMapper.map(@product_form, @product).save!

    redirect_to admin_products_path,
      notice: 'Product was successfully updated.'
  end

  def destroy
    @product.destroy

    redirect_to admin_products_path,
      notice: 'Product was successfully destroyed.'
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_form_params
      params.require(:product_form).permit(
        :name,
        :category_id,
        properties_attributes
      )
    end

    def properties_attributes
      { properties: [:name, :value] }
    end
end
