class ApplicationController < ActionController::Base
	def set_current_user
		if session[:user_id] != nil
			@current_user = User.find(session[:user_id]);
		end
	end

	def set_current_movie
		if(Movie.exists? id: params[:id])
			@movie = Movie.find(params[:id])
	    # @movie.releaseDate = DateTime.now(@movie.releaseDate).ctime
		else
			@movie = nil
		end
	end

	def show_user
		if(User.exists? id: params[:id])
			@user = User.find(params[:id])
		else
			@user = nil
		end
	end
end
