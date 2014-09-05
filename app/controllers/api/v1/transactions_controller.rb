class Api::V1::TransactionsController < ApplicationController
  protect_from_forgery

  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  respond_to :json, :html

  # GET /transactions
  # GET /transactions.json
  def index
    @transactions = Transaction.all
    respond_with @transactions
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    respond_with @transaction
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    respond_with @transaction
  end

  # GET /transactions/1/edit
  def edit
    respond_with @transaction
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.json { render json: @transaction, status: :created }
      else
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        #format.json { render :show, status: :ok, location: nil}
        format.json { render json: @transaction, status: :ok }
      else
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:transaction_id, :status, :energy, :bill)
    end
end
