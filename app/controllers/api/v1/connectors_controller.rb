class Api::V1::ConnectorsController < ApplicationController
  protect_from_forgery

  before_action :set_connector, only: [:show, :edit, :update, :destroy]

  respond_to :json

  # GET /connectors
  # GET /connectors.json
  def index
    @connectors = Connector.all
    respond_with @connectors
  end

  # GET /connectors/1
  # GET /connectors/1.json
  def show
    respond_to do |format|
      format.json { render json: @connector }
    end
  end

  # GET /connectors/new
  def new
    @connector = Connector.new
    respond_with @connector
  end

  # GET /connectors/1/edit
  def edit
    respond_with @connector
  end

  # POST /connectors
  # POST /connectors.json
  def create
    @connector = Connector.new(connector_params)

    respond_to do |format|
      if @connector.save
        format.json { render json: @connector, status: :created }
      else
        format.json { render json: @connector.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /connectors/1
  # PATCH/PUT /connectors/1.json
  def update
    respond_to do |format|
      if @connector.update(connector_params)
        format.json { render json: @connector, status: :ok }
      else
        format.json { render json: @connector.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /connectors/1
  # DELETE /connectors/1.json
  def destroy
    @connector.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_connector
      @connector = Connector.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def connector_params
      params.require(:connector).permit(:name, :charge_point_id)
    end
end
