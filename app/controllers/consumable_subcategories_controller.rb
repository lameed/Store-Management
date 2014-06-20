class ConsumableSubcategoriesController < ApplicationController
	 def destroy
    @consumable = Consumable.find(params[:consumable_id])
    @consumable_subcategory = @consumable.properties.find(params[:id])
    @consumable_subcategory.destroy
    redirect_to consumable_path(@consumable)
  end
 
  private
    def consumable_subcategory_params
      params.require(:consumable_subcategory).permit(:id, :name, :description)
    end
end
