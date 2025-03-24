require "jwt"

class JwtService
  SECRET_KEY = Rails.application.secret_key_base

  def self.encode(payload)
    payload[:exp] = 24.hours.from_now.to_i
    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY).first
    decoded.transform_keys(&:to_sym)
  rescue JWT::DecodeError, JWT::ExpiredSignature, JWT::VerificationError => e
    Rails.logger.error("JWT Error: #{e.message}")
    nil
  end
end
