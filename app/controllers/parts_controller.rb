class PartsController < ApplicationController
	 before_action :set_product, only: [:show, :edit, :update, :destroy]

	def index
    	@parts = Part.all
    	@product = Product.all
    end

  	def show
  		@part = Part.find(params[:id])
  	end

  	def new
    	@part = Part.new
  	end

  	def edit
  		@part = Part.find(params[:id])
  	end

  	def create
    @part = Part.new(part_params)

    respond_to do |format|
      if @part.save
        format.html { redirect_to @part, notice: 'Part was successfully created.' }
        format.json { render :show, status: :created, location: @part }
      else
        format.html { render :new }
        format.json { render json: @part.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @part = Part.find(params[:id])
      if @part.update(part_params)
    redirect_to @part
      else
   render 'edit'
       
      end
   
  end

   def destroy
   	@part = Part.find(params[:id])
    @part.destroy
    respond_to do |format|
      format.html { redirect_to parts_url, notice: 'Part was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

	def set_product
      @product = Product.find(params[:id])
    end
   def part_params
      params.require(:part).permit(:product_id, :title, :description, :number, :image_url, manufacturers_attributes: [:id, :name, :country, :_destroy], suppliers_attributes: [:id, :name, :country, :_destroy],  stores_attributes: [:id, :name, :location, :store_keeper, :quantity, :time_received, :_destroy], uses_attributes: [:id, :description, :_destroy])
    end
end
