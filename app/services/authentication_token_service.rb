class AuthenticationTokenService
  HMAC_SECRET = Rails.application.secrets.secret_key_base
  ALGORITHM_TYPE = 'HS256'.freeze

  def self.call(user_id)
    payload = { user_id: }
    JWT.encode payload, HMAC_SECRET, ALGORITHM_TYPE
  end

  def self.decode(token)
    JWT.decode token, HMAC_SECRET, true, { algorithm: ALGORITHM_TYPE }
  rescue JWT::DecodeError
    false
  end

  def self.valid_payload(_payload)
    true
  end

  def self.expired_token
    render json: { error: 'Invalid or missing token! Please login again' }, status: :unauthorized
  end
end
