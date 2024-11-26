class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show edit update destroy]

   def index
      @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

 def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path, notice: "Category successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

   def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: "Category successfully deleted."
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end