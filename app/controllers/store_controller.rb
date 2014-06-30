class StoreController < ApplicationController
  def index
  	@products = Product.all 
  	@subcategories = Subcategory.where(:product_id => @product)

  end
end
