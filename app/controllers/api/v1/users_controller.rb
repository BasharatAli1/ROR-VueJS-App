class Api::V1::UsersController < ApplicationController
  before_action :show_user
	def index
		@users = User.all
		render json: { users: @users }, status: 200
	end

  def new
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    if @user.save
      render json: { message: 'User is created successfully' }, status: 200
    else
      render json: { message: @user.errors.full_messages }, status: 400
    end
  end

  def show
    render json: { user: @user, movies: userMovies }
  end

  def update
    if @user.update(user_params)
      render json: { user: @user }, status: 200
    else
      render json: { message: @user.errors.full_messages }, status: 400
    end
  end

  def destroy
    if @user.destroy
      render json: { message: 'User was deleted successfully' }, status: 200
    else
      render json: { message: 'Something went wrong!' }, status: 400
    end
  end

  private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password)
    end

    def userMovies
      if @user != nil
        return @user.movies.all.map{ |movie| {
          id: movie.id,
          title: movie.title,
          releaseDate: movie.releaseDate,
        }}
      end
    end
end
