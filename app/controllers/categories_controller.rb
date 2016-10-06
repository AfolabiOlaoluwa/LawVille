class CategoriesController < ApplicationController

  def index
    @category = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(secure_params)
    if @category.save
      flash[:notice] = "Thanks! Category created."
    else
      flash[:notice] = 'Error Creating Category!'
    end
    redirect_to new_category_path
  end

  private


  def secure_params
    params.require(:category).permit(:name, :parent_id)
  end


end
