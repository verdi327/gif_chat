class Api::V1::UsersController < ApplicationController
  respond_to :json, :xml

  def create
    user = User.new(user_params)
    if user.save
      render json: {message: "success", auth_token: user.auth_token}
    else
      render json: {message: user.errors.full_messages}
    end
  end

  def sign_in
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      render json: {message: "success", auth_token: user.auth_token}
    else
      render json: {message: "cannot find user with given email or password"}
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password, :password_confirmation, :email)
  end
end
