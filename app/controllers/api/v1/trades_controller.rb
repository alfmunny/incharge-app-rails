class Api::V1::TradesController < ApplicationController

  protect_from_forgery

  before_action :set_trade, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html

  # GET /trades
  # GET /trades.json
  def index
    @trades = Trade.all
    respond_with @trades
  end

  # GET /trades/1
  # GET /trades/1.json
  def show
    respond_with @trade
  end

  # GET /trades/new
  def new
    @trade = Trade.new
    respond_with @trade
  end

  # GET /trades/1/edit
  def edit
    respond_with @trade
  end

  # POST /trades
  # POST /trades.json
  def create
    @trade = Trade.new(trade_params)

    respond_to do |format|
      if @trade.save
        format.json { render json: @trade, status: :created }
      else
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trades/1
  # PATCH/PUT /trades/1.json
  def update
    respond_to do |format|
      if @trade.update(trade_params)
        #format.json { render :show, status: :ok, location: nil}
        format.json { render json: @trade, status: :ok }
      else
        format.json { render json: @trade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trades/1
  # DELETE /trades/1.json
  def destroy
    @trade.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trade
      @trade = Trade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trade_params
      params.require(:trade).permit(:transaction_id, :status, :energy, :bill)
    end
end
