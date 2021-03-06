class Api::V1::ChargePointsController < ApplicationController
  protect_from_forgery

  before_action :set_charge_point, only: [:show, :edit, :update, :destroy,
    :authorize, :boot_notification, :heartbeat, :meter_values, :start_transaction, :stop_transaction,
    :BootNotification, :Authorize, :Heartbeat, :MeterValues, :StartTransaction, :StopTransaction]
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

  def authorize
    id_tag = params[:id_tag]

    respond_to do |format|
      if id_tag
        @user = User.find_by(id_tag: id_tag)
        if @user && @user.expiry_date > Date.today
          result = {"id_tag_info" => { "status" => "Accepted", "expiry_date" => @user.expiry_date, "parent_id_tag" => "" }}
        elsif @user && user.expiry_date < Date.today
          result = {"id_tag_info" => { "status" => "Expired", "expiry_date" => @user.expiry_date, "parent_id_tag" => "" }}
        else
          result = {"id_tag_info" => { "status" => "Blocked", "expiry_date" => "", "parent_id_tag" => "" }}
        end
      else
        result = {"id_tag_info" => { "status" => "Invalid", "expiry_date" => "", "parent_id_tag" => "" }}
      end
      format.json { render json: result }
    end
  end

  def Authorize
    id_tag = params[:id_tag]

    respond_to do |format|
      if id_tag
        @user = User.find_by(id_tag: id_tag)
        if @user && @user.expiry_date > Date.today
          result = {"id_tag_info" => { "status" => "Accepted", "expiry_date" => @user.expiry_date, "parent_id_tag" => "" }}
        elsif @user && user.expiry_date < Date.today
          result = {"id_tag_info" => { "status" => "Expired", "expiry_date" => @user.expiry_date, "parent_id_tag" => "" }}
        else
          result = {"id_tag_info" => { "status" => "Blocked", "expiry_date" => "", "parent_id_tag" => "" }}
        end
      else
        result = {"id_tag_info" => { "status" => "Invalid", "expiry_date" => "", "parent_id_tag" => "" }}
      end
      format.json { render json: result }
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
      else
        result = { "status" => "Rejected", "current_time" => Time.now,  "heartbeart_interval" => @charge_point[:heartbeat_interval]}
      end
      format.json { render :json => result }
    end
  end

  def BootNotification
    charge_point_vendor = params[:charge_point_vendor]
    charge_point_model = params[:charge_point_model]
    charge_point_serial_number = params[:charge_point_serial_number]
    charge_box_serial_number = params[:charge_box_serial_number]
    firmware_version = params[:firmware_version]
    iccid = params[:iccid]
    imsi = params[:imsi]
    meter_type = params[:meter_type]
    meter_serial_number = params[:meter_serial_number]

    respond_to do |format|
      if charge_point_vendor == @charge_point[:charge_point_vendor] &&
        charge_point_model == @charge_point[:charge_point_model] &&
        charge_point_serial_number == @charge_point[:charge_box_serial_number] &&
        charge_box_serial_number == @charge_point[:charge_box_serial_number] &&
        firmware_version == @charge_point[:firmware_version] &&
        iccid == @charge_point[:iccid] &&
        imsi == @charge_point[:imsi] &&
        meter_type == @charge_point[:meter_type] &&
        meter_serial_number == @charge_point[:meter_serial_number]

        @charge_point.update(status: "Accepted")
        result = { "status" => "Accepted", "current_time" => Time.now,  "heartbeart_interval" => @charge_point[:heartbeat_interval]}
      else
        result = { "status" => "Rejected", "current_time" => Time.now,  "heartbeart_interval" => @charge_point[:heartbeat_interval]}
      end
      format.json { render :json => result }
    end
  end

  def heartbeat
    respond_to do |format|
      result = { "current_time" => Time.now, "heartbeat_interval" => @charge_point[:heartbeat_interval]}
      format.json { render json: result }
    end
  end

  def Heartbeat
    respond_to do |format|
      result = { "current_time" => Time.now, "heartbeat_interval" => @charge_point[:heartbeat_interval]}
      format.json { render json: result }
    end
  end

  def meter_values
    # Mandatory Parameters
    connector_id = params[:connector_id]
    # Optional Parameters but self mandatory
    transaction_id = params[:transaction_id]
    values = params[:values]
    current = values[:current]
    power = values[:power]

    if current.include? ","
      current[','] = '.'
    end

    if power.include? ","
      power[','] = '.'
    end

    respond_to do |format|
      if connector_id && transaction_id && values
        @trade = Trade.find(transaction_id)
        @connector = Connector.find(connector_id)
        @record = Record.create(trade_id: @trade.id, power: values[:power], current: values[:current])
        result = {}
        format.json { render json: result }
      else
        result = { "error" => "parameters required" }
        format.json { render json: result }
      end
    end
  end

  def MeterValues
    # Mandatory Parameters
    connector_id = params[:connector_id]
    # Optional Parameters but self mandatory
    transaction_id = params[:transaction_id]
    values = params[:values]
    current = values[:current]
    power = values[:power]

    if current.include? ","
      current[','] = '.'
    end

    if power.include? ","
      power[','] = '.'
    end

    respond_to do |format|
      if connector_id && transaction_id && values
        @trade = Trade.find(transaction_id)
        @connector = Connector.find(connector_id)
        @record = Record.create(trade_id: @trade.id, power: values[:power], current: values[:current])
        result = {}
        format.json { render json: result }
      else
        result = { "error" => "parameters required" }
        format.json { render json: result }
      end
    end
  end

  def start_transaction
    # Mandatory Parameters
    id_tag = params[:id_tag]
    connector_id = params[:connector_id]
    #timestamp = params[:timestamp]
    meter_start = params[:meter_start]
    # Optinal Parameters
    reservation_id = params[:reservation_id]

    # Optional Parameters but self Mandatory
    # vehicle_id = params[:vehicle_id]
    vehicle_name = params[:vehicle_name]
    vehicle_id = Vehicle.find_by name: vehicle_name

    respond_to do |format|
      if id_tag && connector_id && meter_start
        @user = User.find_by(id_tag: id_tag)
        if @user
          if @user.expiry_date > Date.today
            @trade = Trade.create(user_id: @user.id, charge_point_id: @charge_point.id,
            connector_id: connector_id, energy: 0, bill: 0, status: 'Started', meter_start: meter_start)
            if vehicle_id and Vehicle.find(vehicle_id)
              @trade.update(vehicle_id: vehicle_id)
            else
              result = {"error" => "no vehicle found"}
            end
            result = {
              "transaction_id" => @trade.id,
              "id_tag_info" => { "status" => "Accepted", "expiry_date" => @user.expiry_date, "parent_id_tag" => "" }
            }
            #result = { "id_tag" => id_tag }
            format.json { render json: result }
          else @user.expiry_date < Date.tody
            result = {
              "transaction_id" => "null",
              "id_tag_info" => { "status" => "Expired", "expiry_date" => @user.expiry_date, "parent_id_tag" => "" }
            }
            format.json { render json: result }
          end
        else
          result = {
            "transaction_id" => "null",
            "id_tag_info" => { "status" => "Invalid", "expiry_date" => "", "parent_id_tag" => "" }
          }
          format.json { render json: result }
        end
      else
        result = { "error" => "parameters required"}
        format.json { render json: result }
      end
    end
  end

  def StartTransaction
    # Mandatory Parameters
    id_tag = params[:id_tag]
    connector_id = params[:connector_id]
    #timestamp = params[:timestamp]
    meter_start = params[:meter_start]
    # Optinal Parameters
    reservation_id = params[:reservation_id]

    # Optional Parameters but self Mandatory
    #vehicle_id = params[:vehicle_id]
    vehicle_name = params[:vehicle_name]
    vehicle_id = Vehicle.find_by name: vehicle_name

    respond_to do |format|
      if id_tag && connector_id && meter_start
        @user = User.find_by(id_tag: id_tag)
        if @user
          if @user.expiry_date > Date.today
            @trade = Trade.create(user_id: @user.id, charge_point_id: @charge_point.id,
            connector_id: connector_id, energy: 0, bill: 0, status: 'Started', meter_start: meter_start)
            if vehicle_id and Vehicle.find(vehicle_id)
              @trade.update(vehicle_id: vehicle_id)
            else
              result = {"error" => "no vehicle found"}
            end
            result = {
              "transaction_id" => @trade.id,
              "id_tag_info" => { "status" => "Accepted", "expiry_date" => @user.expiry_date, "parent_id_tag" => "" }
            }
            #result = { "id_tag" => id_tag }
            format.json { render json: result }
          else @user.expiry_date < Date.tody
            result = {
              "transaction_id" => "null",
              "id_tag_info" => { "status" => "Expired", "expiry_date" => @user.expiry_date, "parent_id_tag" => "" }
            }
            format.json { render json: result }
          end
        else
          result = {
            "transaction_id" => "null",
            "id_tag_info" => { "status" => "Invalid", "expiry_date" => "", "parent_id_tag" => "" }
          }
          format.json { render json: result }
        end
      else
        result = { "error" => "parameters required"}
        format.json { render json: result }
      end
    end
  end

  def stop_transaction
    # Mandatory Parameters
    meter_stop= params[:meter_stop]
    transaction_id = params[:transaction_id]
    #timestamp = params[:timestamp]

    # Optional Parameters
    id_tag = params[:id_tag]
    transaction_data = params[:transaction_data]
    bill = transaction_data[:bill]
    energy = transaction_data[:energy]

    if bill.include? ","
      bill[','] = '.'
    end

    if energy.include? ","
      energy[','] = '.'
    end

    respond_to do |format|
      if meter_stop && transaction_id && transaction_data
        @trade = Trade.find(transaction_id)
        @user = User.find(@trade.user_id)
        @trade.update(status: "Finished", meter_stop: meter_stop, bill: transaction_data[:bill], energy: transaction_data[:energy])
        result = { "id_tag_info" => { "status" => "Accepted", "expiry_date" => @user.expiry_date, "parent_id_tag" => "" }}
        format.json { render json: result }
      else
        result = { "id_tag_info" => { "status" => "Invalid", "expiry_date" => "", "parent_id_tag" => "" } }
        format.json { render json: result }
      end
    end
  end


  def StopTransaction
    # Mandatory Parameters
    meter_stop= params[:meter_stop]
    transaction_id = params[:transaction_id]
    #timestamp = params[:timestamp]

    # Optional Parameters
    id_tag = params[:id_tag]
    transaction_data = params[:transaction_data]
    bill = transaction_data[:bill]
    energy = transaction_data[:energy]

    if bill.include? ","
      bill[','] = '.'
    end

    if energy.include? ","
      energy[','] = '.'
    end

    respond_to do |format|
      if meter_stop && transaction_id && transaction_data
        @trade = Trade.find(transaction_id)
        @user = User.find(@trade.user_id)
        @trade.update(status: "Finished", meter_stop: meter_stop, bill: transaction_data[:bill], energy: transaction_data[:energy])
        result = { "id_tag_info" => { "status" => "Accepted", "expiry_date" => @user.expiry_date, "parent_id_tag" => "" }}
        format.json { render json: result }
      else
        result = { "id_tag_info" => { "status" => "Invalid", "expiry_date" => "", "parent_id_tag" => "" } }
        format.json { render json: result }
      end
    end
  end

  # Operations which are not used right now, you can modify them for using
  def StatusNotification
    respond_to do |format|
      result = {}
      format.json {render json: result}
    end
  end

  def FirmwareStatusNotification
    respond_to do |format|
      result = {}
      format.json {render json: result}
    end
  end

  def DiagnosticsStatusNotification
    respond_to do |format|
      result = {}
      format.json {render json: result}
    end
  end

  def DataTransfer
    respond_to do |format|
      result = {}
      format.json {render json: result}
    end
  end

  def status_notification
    respond_to do |format|
      result = {}
      format.json {render json: result}
    end
  end

  def firm_status_notification
    respond_to do |format|
      result = {}
      format.json {render json: result}
    end
  end

  def diagnostics_status_notification
    respond_to do |format|
      result = {}
      format.json {render json: result}
    end
  end

  def data_transfer
    respond_to do |format|
      result = {}
      format.json {render json: result}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_charge_point
      @charge_point = ChargePoint.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def charge_point_params
      # params.require(:charge_point).permit(:name, :status, :charge_point_vendor, :charge_point_model,
      # :charge_point_serial_number, :firmware_version, :iccid, :imsi, :meter_type, :meter_serial_number,
      # :heartbeat_interval, :charge_box_serial_number, :user_ids)
      params.require(:charge_point).permit!
    end
end
