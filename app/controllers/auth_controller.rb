class AuthController < ApplicationController
  def register
    result = Users::CreateUser.new(user_params).call

    if result[:success]
      token = JwtService.encode(user_id: result[:user].id)
      render json: { user: result[:user], token: token }, status: :created
    else
      render json: { errors: result[:errors] }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      token = JwtService.encode(user_id: user.id)
      render json: { token: token, user: user }
    else
      render json: { error: "Credenciais inválidas" }, status: :unauthorized
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
