class MoviesController < ApplicationController
	before_action :load_movie, only: [:edit, :show, :update]

	def index
		@movies = Movie.all
	end

	def show
	end

	def new
		@movie = Movie.new
	end

	def create
		@movie = Movie.new(safe_movie_params)
		if @movie.save
			redirect_to @movie
		else
			render 'new'
		end
	end

	def edit
	end

	def update
	end


	private
		def load_movie
			@movie = Movie.find_by_id(params[:id])
		rescue ActiveRecord::RecordNotFound
			Flash.now[:notice] = "Invalid Movie Id #{params[:id]}"
			redirect_to root_path
		end

		def safe_movie_params
			params.require('movie').permit(:title,:description,:year_released)
		end
end