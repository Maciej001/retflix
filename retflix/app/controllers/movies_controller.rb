class MoviesController < ApplicationController

	before_action :load_movie, only: [:show, :edit, :update]

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(movie_params)
		if @movie.save 
			redirect_to @movie
		else
			render 'new'
		end
	end

	def show
	end

	def index
		@movies = Movie.search_for(params[:q])
	end

	def edit 
	end

	def update
		@movie.update movie_params
	end

	private

		def load_movie
			@movie = Movie.find(params[:id])
		end

  	def movie_params
  		params.require(:movie).permit(:title, :year, :description)
  	end

end
