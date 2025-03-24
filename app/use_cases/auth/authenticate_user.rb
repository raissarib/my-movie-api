module Auth
  class AuthenticateUser
    def initialize(email, password)
      @email = email
      @password = password
    end

    def call
      user = User.find_by(email: @email)
      return { success: false, error: "Credenciais inválidas" } unless user&.authenticate(@password)

      token = Auth::GenerateJWT.call(user)
      { success: true, token: token, user: user }
    end
  end
end
