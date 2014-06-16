class SubcategoriesController < ApplicationController

	def create
    @product = Product.find(params[:product_id])
    @subcategory = @product.subcategories.create(subcategory_params)
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @subcategory = @product.subcategories.find(params[:id])
    @subcategory.destroy
    redirect_to product_path(@product)
  end
 
  private
    def subcategory_params
      params.require(:subcategory).permit(:title, :description)
    end
end
