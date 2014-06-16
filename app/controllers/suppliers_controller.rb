class SuppliersController < ApplicationController

	def destroy
    @part = Part.find(params[:part_id])
    @supplier = @part.suppliers.find(params[:id])
    @supplier.destroy
    redirect_to part_path(@part)
  end
 
  private
    def manufacturer_params
      params.require(:supploer).permit(:name, :country, :part_id)
    end
end
