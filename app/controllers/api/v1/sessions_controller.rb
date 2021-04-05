class Api::V1::SessionsController < ApplicationController
  def index
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
  		render json: { message: "Current User Returned", user: @user }, status: 200
    else
      render json: { message: "NO any user logged in" }, status: 400
    end
  end
  
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user 
      if user.authenticate(params[:session][:password])
    		session[:user_id] = user.id
        render json: { message: "User Logged in successfully", user: user }, status: 200
      else
        render json: { message: "Some thing went wrong" }, status: 400
      end
    else
      render json: { message: "Some thing went wrong" }, status: 400
  	end
  end

  def destroy
  	session[:user_id] = nil
      render json: { message: "User Logged out successfully" }, status: 200
  end

end 
