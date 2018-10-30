class SessionsController < ApplicationController
  skip_before_action :check_for_current_user, except: [:create]

  def create
    user = User
            .find_by(email: params['user']['email'])
            .try(:authenticate, params['user']['password'])

    if user
      session[:user_id] = user.id
      puts "sesion" * 1000, session.inspect, "session" * 1000, user.inspect, "session" * 1000, session[:user_id], "session" * 1000
      render json: { status: :created, logged_in: true, user: user }
    else
      render json: { status: 500 }
    end
  end

  def logged_in
    puts "LI sesion" * 1000, session.inspect, "LI session" * 1000, user.inspect, "LI session" * 1000, session[:user_id], "LI session" * 1000
    if @current_user
      render json: { logged_in: true, user: @current_user }
    else
      render json: { logged_in: false }
    end
  end

  def logout
    reset_session
    render json: { status: 200 }
  end
end
