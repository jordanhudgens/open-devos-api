class SessionsController < ApplicationController
  skip_before_action :check_for_current_user, only: [:create]

  def create
    user = User
            .find_by(email: params['user']['email'])
            .try(:authenticate, params['user']['password'])

    if user
      session[:user_id] = user.id
      render json: { status: :created, logged_in: true, user: user, avatar: user.avatar_url }
    else
      render json: { status: 500 }
    end
  end

  def logged_in
    if @current_user
      render json: { logged_in: true, user: @current_user, avatar: @current_user.avatar_url }
    else
      render json: { logged_in: false }
    end
  end

  def logout
    reset_session
    render json: { status: 200 }
  end
end
