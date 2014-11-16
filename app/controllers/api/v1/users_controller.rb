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

  def generate_idtag
    letters = [('A'...'Z')].map { |i| i.to_a }.flatten
    numbers = [('1'...'10')].map { |i| i.to_a }.flatten
    string = (0...2).map {letters[rand(letters.length)]}.join + (0...8).map {numbers[rand(numbers.length)]}.join
    return string
  end

  def create
    @user = User.create(user_params)
    @user.save
    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
      else
        format.json { render json: {errors: @user.errors}, status: 422}
      end
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    respond_with @user
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
