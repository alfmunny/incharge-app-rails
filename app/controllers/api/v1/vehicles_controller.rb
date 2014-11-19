class Api::V1::VehiclesController < ApplicationController
  protect_from_forgery
  include ActionController::Live

  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]
  respond_to :json
  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all
    respond_with @vehicles

    #response.headers['Content-Type'] = 'text/event-stream'
    # data = @vehicles.to_json
    # response.stream.write "{data: #{data}"
    # response.stream.close
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
    respond_with @vehicle
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
    respond_with @vehicle
  end

  # GET /vehicles/1/edit
  def edit
    respond_with @vehicle
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    respond_to do |format|
      if @vehicle.save
        format.json { render json: @vehicle, status: :created }
      else
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.json { render json: @vehicle, status: :ok }
      else
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      #params.require(:vehicle).permit(:vehicle_type, :name, :avatar, {:user_ids => []})
      params.require(:vehicle).permit!
    end
end
