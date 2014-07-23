class PartLineItemsController < ApplicationController
  before_action :set_part_line_item, only: [:show, :edit, :update, :destroy]

  # GET /part_line_items
  # GET /part_line_items.json
  def index
    @part_line_items = PartLineItem.all
  end

  # GET /part_line_items/1
  # GET /part_line_items/1.json
  def show
  end

  # GET /part_line_items/new
  def new
    @part_line_item = PartLineItem.new
  end

  # GET /part_line_items/1/edit
  def edit
  end

  # POST /part_line_items
  # POST /part_line_items.json
  def create
    @part_request = current_part_request
    part = Part.find(params[:part_id])
    @part_line_item = @part_request.add_part(part.id)

    respond_to do |format|
      if @part_line_item.save
        format.html { redirect_to parts_url }
        format.js
        format.json { render :show, status: :created, location: @part_line_item }
      else
        format.html { render :new }
        format.json { render json: @part_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_line_items/1
  # PATCH/PUT /part_line_items/1.json
  def update
    respond_to do |format|
      if @part_line_item.update(part_line_item_params)
        format.html { redirect_to @part_line_item, notice: 'Part line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_line_item }
      else
        format.html { render :edit }
        format.json { render json: @part_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_line_items/1
  # DELETE /part_line_items/1.json
  def destroy
    @part_line_item.destroy
    respond_to do |format|
      format.html { redirect_to part_line_items_url, notice: 'Part line item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_line_item
      @part_line_item = PartLineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_line_item_params
      params.require(:part_line_item).permit(:part_id, :part_request_id)
    end
end
