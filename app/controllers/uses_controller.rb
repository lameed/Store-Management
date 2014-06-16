class UsesController < ApplicationController

	def destroy
    @part = Part.find(params[:part_id])
    @use = @part.uses.find(params[:id])
    @use.destroy
    redirect_to part_path(@part)
  end
 
  private
    def use_params
      params.require(:use).permit(:description, :part_id)
    end
end
