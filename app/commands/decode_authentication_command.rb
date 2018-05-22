class DecodeAuthenticationCommand < BaseCommand
  private

  attr_reader :headers

  def initialize(headers)
    @headers = headers
    @user = nil
  end

  def payload
    return unless token_present?
    @result = user if user
  end

  def user
    @user ||= User.find_by(id: decoded_id)
    @user || errors.add(:token, 'Token invalid') && nil
  end

  def token_present?
    token.present? && token_contents.present?
  end

  def token
    return authorization_header.split(' ').last if authorization_header.present?
    errors.add(:token, 'Token missing')
    nil
  end

  def authorization_header
    headers['Authorization']
  end

  def token_contents
    @token_contents ||= begin
      decoded = JwtService.decode(token)
      errors.add(:token, 'Token expired') unless decoded
      decoded
    end
  end

  def decoded_id
    token_contents['user_id']
  end
end
