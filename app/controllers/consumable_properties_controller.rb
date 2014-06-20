class ConsumablePropertiesController < ApplicationController
	 def destroy
    @consumable = Consumable_Subccategory.find(params[:consumable_subcategory_id])
    @consumable_property = @consumable.properties.find(params[:id])
    @consumable_property.destroy
    redirect_to consumable_path(@consumable)
  end
 
  private
    def consumable_property_params
      params.require(:consumable_property).permit(:id, :name, :manufacturer, :designer, :description, :date_ordered, :date_supplied, :unit_weight, :length, :drawing)
    end
end
