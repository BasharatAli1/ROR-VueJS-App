class Api::V1::MoviesController < ApplicationController
before_action :set_current_user, :set_current_movie
	def index
		@movies = Movie.all
		render json: { movies: @movies }, status: 200
	end

  def new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = @current_user
    if @movie.save
      render json: { message: 'Movie is created successfully' }, status: 200
    else
      render json: { message: @movie.errors.full_messages }, status: 400
    end
  end

  def show
    render json: { movie: @movie, user: @movie.user }
  end

  def update
    if @movie.update(movie_params)
      render json: { movie: @movie }, status: 200
    else
      render json: { message: @movie.errors.full_messages }, status: 400
    end
  end

  def destroy
    if @movie.destroy
      render json: { message: 'Movie was deleted successfully' }, status: 200
    else
      render json: { message: 'Something went wrong!' }, status: 400
    end
  end

  private
  
    def movie_params
      params.require(:movie).permit(:title, :releaseDate)
    end
end
