class ConsumablesController < ApplicationController
	 before_action :set_consumable, only: [:show, :edit, :update, :destroy]

	def index
    	@consumables = Consumable.all
    	@parts = Part.all
    end

  	def show
  		@consumable = Consumable.find(params[:id])
  	end

  	def new
    	@consumable = Consumable.new
  	end

  	def edit
  		@consumable = Consumable.find(params[:id])
  	end

  	def create
    @consumable = Consumable.new(consumable_params)

    respond_to do |format|
      if @consumable.save
        format.html { redirect_to @consumable, notice: 'consumable was successfully created.' }
        format.json { render :show, status: :created, location: @consumable }
      else
        format.html { render :new }
        format.json { render json: @consumable.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @consumable = Consumable.find(params[:id])
      if @consumable.update(consumable_params)
    redirect_to @consumable
      else
   render 'edit'
       
      end
   
  end

   def destroy
   	@consumable = Consumable.find(params[:id])
    @consumable.destroy
    respond_to do |format|
      format.html { redirect_to consumables_url, notice: 'consumable was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private

	def set_consumable
      @consumable = Consumable.find(params[:id])
    end
   def consumable_params
      params.require(:consumable).permit(:name, :description,  consumable_subcategories_attributes: [:id, :name, :description, :_destroy], suppliers_attributes: [:id, :name, :country, :_destroy],  stores_attributes: [:id, :name, :location, :store_keeper, :quantity, :time_received, :_destroy], uses_attributes: [:id, :description, :_destroy])
    end
end
