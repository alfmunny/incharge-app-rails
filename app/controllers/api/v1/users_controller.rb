class Api::V1::UsersController < ApplicationController
  protect_from_forgery

  respond_to :json

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

  def update
    respond_with User.update(params[:id], user_params)
  end

  def destroy
    @user = User.destroy(params[:id])
    respond_with @user
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :company, :expiry_date, :password, :id_tag)
  end

end
