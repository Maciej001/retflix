class MoviesController < ApplicationController

	before_action :load_movie, only: [:show, :edit, :update, :destroy]

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new movie_params 
		if @movie.save 
			flash[:notice] = "Movie added successfully!"
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
		if @movie.update movie_params
			flash[:notice] = "Movie updated successfully!"
			redirect_to @movie
		else
			render 'edit'
		end
	end

	def destroy
		@movie.destroy
		flash[:notice] = "'#{@movie.title}' deleted!"
		redirect_to movies_path
	end

	private

		def load_movie
			@movie = Movie.find(params[:id])
		end

  	def movie_params
  		params.require(:movie).permit(:title, :year, :description, :image)
  	end

end
