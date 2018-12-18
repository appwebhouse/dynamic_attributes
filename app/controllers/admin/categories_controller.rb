class Admin::CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.order(id: :asc)
  end

  def show; end

  def new
    @category_form = CategoryForm.new
    @category_form.properties = [CategoryPropertyForm.new]
  end

  def edit
    @category_form = CategoryMapper.map(@category, CategoryForm.new)
  end

  def create
    @category_form = CategoryForm.new(category_form_params)

    return render :new unless @category_form.valid?

    CategoryFormMapper.map(@category_form, Category.new).save!

    redirect_to admin_categories_path,
      notice: 'Category was successfully created.'
  end

  def update
    @category_form = CategoryForm.new(category_form_params)

    return render :edit unless @category_form.valid?

    CategoryFormMapper.map(@category_form, @category).save!

    redirect_to admin_categories_path,
      notice: 'Category was successfully updated.'
  end

  def destroy
    @category.destroy

    redirect_to admin_categories_path,
      notice: 'Category was successfully destroyed.'
  end

  private
    def set_category
      @category = Category.find(params[:id])
    end

    def category_form_params
      params.require(:category_form).permit(
        :name,
        :parent_id,
        properties_attributes
      )
    end

    def properties_attributes
      { properties: [:name, :type] }
    end
end
