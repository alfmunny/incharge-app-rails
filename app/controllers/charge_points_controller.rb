class ChargePointsController < ApplicationController
  before_action :set_charge_point, only: [:show, :edit, :update, :destroy]

  # GET /charge_points
  # GET /charge_points.json
  def index
    @charge_points = ChargePoint.all
  end

  # GET /charge_points/1
  # GET /charge_points/1.json
  def show
  end

  # GET /charge_points/new
  def new
    @charge_point = ChargePoint.new
  end

  # GET /charge_points/1/edit
  def edit
  end

  # POST /charge_points
  # POST /charge_points.json
  def create
    @charge_point = ChargePoint.new(charge_point_params)

    respond_to do |format|
      if @charge_point.save
        format.html { redirect_to @charge_point, notice: 'Charge point was successfully created.' }
        format.json { render :show, status: :created, location: @charge_point }
      else
        format.html { render :new }
        format.json { render json: @charge_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /charge_points/1
  # PATCH/PUT /charge_points/1.json
  def update
    respond_to do |format|
      if @charge_point.update(charge_point_params)
        format.html { redirect_to @charge_point, notice: 'Charge point was successfully updated.' }
        format.json { render :show, status: :ok, location: @charge_point }
      else
        format.html { render :edit }
        format.json { render json: @charge_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /charge_points/1
  # DELETE /charge_points/1.json
  def destroy
    @charge_point.destroy
    respond_to do |format|
      format.html { redirect_to charge_points_url, notice: 'Charge point was successfully destroyed.' }
      format.json { head :no_content }
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
