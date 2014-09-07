class Api::V1::RecordsController < ApplicationController
  protect_from_forgery

  before_action :set_record, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /records
  # GET /records.json
  def index
    @records = Record.all
    respond_with @records
  end

  # GET /records/1
  # GET /records/1.json
  def show
    respond_with @record
  end

  # GET /records/new
  def new
    @record = Record.new
    respond_with @record
  end

  # GET /records/1/edit
  def edit
    respond_with @record
  end

  # POST /records
  # POST /records.json
  def create
    @record = Record.new(record_params)

    respond_to do |format|
      if @record.save
        format.json { render json: @record, status: :created }
      else
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /records/1
  # PATCH/PUT /records/1.json
  def update
    respond_to do |format|
      if @record.update(record_params)
        format.json { render json: @record, status: :ok }
      else
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /records/1
  # DELETE /records/1.json
  def destroy
    @record.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record
      @record = Record.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_params
      params.require(:record).permit(:power, :current, :voltage)
    end
end
