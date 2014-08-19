class Api::V1::UsersController < ApplicationController
  respond_to :json, :xml, :html

  def index
    @users = User.all
    respond_with @users
  end

  def show
    @user = User.find(params[:id])
    respond_with @user
  end

  def create
    @user = User.create(user_params)
    @user.save
    respond_with @user, location: nil
  end

  def new
    @user = User.new(params[user_params])
    @user.save
    respond_with @user
  end

  def update
    @user = User.update(params[:id], user_params)
    respond_with @user
  end

  def destroy
    @user = User.destroy(params[:id])
    respond_with @user
  end

  private
  def user_params
    params.require(:post).permit(:name, :email, :company, :expiry_date)
  end

end
