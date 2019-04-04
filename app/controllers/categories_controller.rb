class CategoriesController < ApplicationController
	def new
		@category = Category.new
	end
	def index
		@categories = Category.all
	end
  def show
    @category = Category.find(params[:id])
    @books = @category.bookofcategory
  end
	def create
    @category = Category.new(category_params)
    	if @category.save
      	flash[:info] = "Adding Category Success!"
      	redirect_to root_url
    	else
      		render 'new'
    	end
  	end
  def edit
    @category = Category.find(params[:id])
  end
  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      flash[:success] = "Category updated"
      redirect_to @category
    else
      render 'edit'
    end
  end
  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = "Category deleted"
    redirect_to categories_url
  end
  private
    def category_params
      params.require(:category).permit(:name)
    end
end
