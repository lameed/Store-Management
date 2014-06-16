class StoresController < ApplicationController

	def destroy
    @part = Part.find(params[:part_id])
    @store = @product.stores.find(params[:id])
    @store.destroy
    redirect_to part_path(@part)
  end
 
  private
    def store_params
      params.require(:store).permit(:name, :location, :store_keeper, :quantity, :time_received, :part_id)
    end
end
