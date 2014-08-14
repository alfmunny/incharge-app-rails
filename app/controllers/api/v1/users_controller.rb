class Api::V1::UsersController < ApplicationController
  respond_to :json

  def index
    #render json: User.all
    respond_with User.all
  end
end
