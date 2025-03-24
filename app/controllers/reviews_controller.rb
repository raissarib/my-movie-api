class ReviewsController < ApplicationController
  before_action :set_review, :authenticate_user!, only: [ :show, :update, :destroy ]

  def index
    reviews = Review.all
    render json: reviews
  end

  def show
    render json: @review
  end

  def create
    review = Review.new(review_params)
    if review.save
      render json: review, status: :created
    else
      render json: { errors: review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @review.update(review_params)
      render json: @review
    else
      render json: { errors: @review.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    head :no_content
  end

  private

  def set_review
    @review = Review.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Avaliação não encontrada" }, status: :not_found
  end

  def review_params
    params.require(:review).permit(:user_id, :movie_id, :rating, :comment)
  end
end
