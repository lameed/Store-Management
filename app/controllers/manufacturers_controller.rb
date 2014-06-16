class ManufacturersController < ApplicationController

  def destroy
    @part = Part.find(params[:part_id])
    @manufacturer = @part.manufacturers.find(params[:id])
    @manufacturer.destroy
    redirect_to part_path(@prt)
  end
 
  private
    def manufacturer_params
      params.require(:manufacturer).permit(:name, :country, :part_id)
    end
end
