class UserTokenController < Knock::AuthTokenController
  protect_from_forgery unless: -> { request.format.json? }
  skip_before_action :verify_authenticity_token
end
