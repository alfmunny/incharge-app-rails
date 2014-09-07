class Api::V1::ChargePointsController < ApplicationController
  protect_from_forgery

  before_action :set_charge_point, only: [:show, :edit, :update, :destroy,
    :boot_notification, :heartbeat, :meter_values, :start_transaction, :stop_transaction]
  respond_to :json, :html

  # GET /charge_points
  # GET /charge_points.json
  def index
    @charge_points = ChargePoint.all
    respond_with @charge_points
  end

  # GET /charge_points/1
  # GET /charge_points/1.json
  def show
    #respond_with(@charge_point, @charge_point.vehicles)
    respond_to do |format|
      format.json { render json: @charge_point }
    end
  end

  # GET /charge_points/new
  def new
    @charge_point = ChargePoint.new
    respond_with @charge_point
  end

  # GET /charge_points/1/edit
  def edit
    respond_with @charge_point
  end

  # POST /charge_points
  # POST /charge_points.json
  def create
    @charge_point = ChargePoint.new(charge_point_params)

    respond_to do |format|
      if @charge_point.save
        format.json { render json: @charge_point, status: :created }
      else
        format.json { render json: @charge_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charge_points/1
  # PATCH/PUT /charge_points/1.json
  def update
    respond_to do |format|
      if @charge_point.update(charge_point_params)
        #format.json { render :show, status: :ok, location: nil}
        format.json { render json: @charge_point, status: :ok }
      else
        format.json { render json: @charge_point.errors, status: :unprocessable_entity }
      end
    end
    # @charge_point.update(charge_point_params)
    # respond_with @charge_point
  end

  # DELETE /charge_points/1
  # DELETE /charge_points/1.json
  def destroy
    @charge_point.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  def boot_notification
    charge_point_vendor = params[:charge_point_vendor]
    charge_point_model = params[:charge_point_model]
    charge_point_serial_number = params[:charge_point_serial_number]
    charge_box_serial_number = params[:charge_box_serial_number]
    respond_to do |format|
      if charge_point_vendor == @charge_point[:charge_point_vendor]
        @charge_point.update(status: "Accepted")
        result = { "status" => "Accepted", "current_time" => Time.now,  "heartbeart_interval" => @charge_point[:heartbeat_interval]}
        #format.json { render json: @charge_point, status: :ok}
        format.json { render json: result, status: :ok}
      else
        result = { "status" => "Rejected", "current_time" => Time.now,  "heartbeart_interval" => @charge_point[:heartbeat_interval]}
        format.json { render json: result}
      end
    end
  end

  def heartbeat
    respond_to do |format|
      result = { "current_time" => Time.now, "heartbeat_interval" => @charge_point[:heartbeat_interval]}
      format.json { render json: result }
    end
  end

  def meter_values
    respond_to do |format|
      format.json { render json: @charge_point.errors }
    end
  end

  def start_transaction
    respond_to do |format|
      format.json { render json: @charge_point }
    end
  end

  def stop_transaction
    respond_to do |format|
      format.json { render json: @charge_point }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge_point
      @charge_point = ChargePoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_point_params
      params.require(:charge_point).permit(:status, :charge_point_vendor, :charge_point_model, :charge_point_serial_number, :firmware_version, :iccid, :imsi, :meter_type, :meter_serial_number, :heartbeat_interval, :charge_box_serial_number)
    end
end
