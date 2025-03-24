module AuthenticateUser
  def current_user
    @current_user ||= User.find(decoded_token[:user_id]) if decoded_token
  end

  def authenticate_user!
    render json: { error: "Acesso não autorizado" }, status: :unauthorized unless current_user
  end

  def authorize_user!(resource)
    unless current_user.id == resource.user_id
      render json: { error: "Você não tem permissão para acessar este recurso" }, status: :forbidden
    end
  end

  private

  def decoded_token
    if request.headers["Authorization"].present?
      token = request.headers["Authorization"].split(" ").last
      JwtService.decode(token)
    end
  end
end
