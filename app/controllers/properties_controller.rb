class PropertiesController < ApplicationController

  def destroy
    @product = Product.find(params[:product_id])
    @property = @product.properties.find(params[:id])
    @property.destroy
    redirect_to product_path(@product)
  end
 
  private
    def property_params
      params.require(:property).permit(:name, :value)
    end
end
