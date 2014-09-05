class Api::V1::ChargePointController < ApplicationController
  respond_to :json
  def index
    @charge_point = ChargePoint.find(params[:id])
    respond_with(@charge_point)
  end
end
