class PartRequestsController < ApplicationController
  before_action :set_part_request, only: [:show, :edit, :update, :destroy]

  # GET /part_requests
  # GET /part_requests.json
  def index
    @part_requests = PartRequest.all
  end

  # GET /part_requests/1
  # GET /part_requests/1.json
  def show
    begin
      @part_request = PartRequest.find(params[:id])
      rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid request #{params[:id]}"
      redirect_to parts_url, :notie => 'invalid request'
    else
      respond_to do |format|
        format.html
        format.xml { render :xml => @part_request }
      end
    end
  end

  # GET /part_requests/new
  def new
    @part_request = PartRequest.new
  end

  # GET /part_requests/1/edit
  def edit
  end

  # POST /part_requests
  # POST /part_requests.json
  def create
    @part_request = PartRequest.new(part_request_params)

    respond_to do |format|
      if @part_request.save
        format.html { redirect_to @part_request, notice: 'Part request was successfully created.' }
        format.json { render :show, status: :created, location: @part_request }
      else
        format.html { render :new }
        format.json { render json: @part_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_requests/1
  # PATCH/PUT /part_requests/1.json
  def update
    respond_to do |format|
      if @part_request.update(part_request_params)
        format.html { redirect_to @part_request, notice: 'Part request was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_request }
      else
        format.html { render :edit }
        format.json { render json: @part_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_requests/1
  # DELETE /part_requests/1.json
  def destroy
    @part_request = PartRequest.find(params[:id])
    @part_request.destroy
    session[:part_request_id] = nil
    respond_to do |format|
      format.html { redirect_to parts_url, notice: 'Your request is currently empty.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_request
      @part_request = PartRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_request_params
      params[:part_request]
    end
end
