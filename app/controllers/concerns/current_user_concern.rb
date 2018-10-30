module CurrentUserConcern
  extend ActiveSupport::Concern

  included do
    attr_reader :current_user

    before_action :check_for_current_user
  end

  private

  def check_for_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end
end
