module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    attr_reader :current_user

    before_action :check_for_current_user
  end

  private

  def check_for_current_user
    if request.headers['Authorization'] != 'Bearer null'
      @current_user = DecodeAuthenticationCommand.call(request.headers).result
    end
  end
end
