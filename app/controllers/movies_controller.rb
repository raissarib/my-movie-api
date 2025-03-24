class MoviesController < ApplicationController
  before_action :set_movie, :authenticate_user!, only: [ :show, :update, :destroy ]

  def index
    movies = Movie.all
    render json: movies
  end

  def show
    render json: @movie
  end

  def create
    movie = Movie.new(movie_params)
    if movie.save
      render json: movie, status: :created
    else
      render json: { errors: movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie
    else
      render json: { errors: @movie.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    head :no_content
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Filme não encontrado" }, status: :not_found
  end

  def movie_params
    params.require(:movie).permit(:title, :director, :year, :genre)
  end
end
