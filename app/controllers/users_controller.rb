class UsersController < ApplicationController
  before_action :authenticate_user!, except: [ :create, :index ]
  before_action :set_user, only: [ :show, :update, :destroy ]

  def index
    users = User.all
    render json: users
  end

  def show
    render json: @user
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Usuário não encontrado" }, status: :not_found
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
