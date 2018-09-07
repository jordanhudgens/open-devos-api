class AuthsController < ApplicationController
  skip_before_action :authenticate_user

  def logged_in
    current_user = DecodeAuthenticationCommand.call(request.headers).result

    if current_user
      render json: { logged_in: true }
    else
      render json: { logged_in: false }
    end
  end

  def register
    email, password, password_confirmation, profile_slug = params.slice(:user, :password, :password_confirmation, :profile_slug).values

    user = User.create!(
      email: email,
      password: password,
      password_confirmation: password_confirmation,
      profile_slug: profile_slug
    )

    if user
      token_command = AuthenticateUserCommand.call(user.email, user.password)

      if token_command.success?
        render json: { token: token_command.result }
      else
        render json: { error: token_command.errors }, status: :unauthorized
      end
    else
      render json: { error: 'Error creating account' }, status: :unprocessible_entity
    end

  end

  def login
    token_command = AuthenticateUserCommand.call(*params.slice(:user, :password).values)

    if token_command.success?
      render json: { token: token_command.result }
    else
      render json: { error: token_command.errors }, status: :unauthorized
    end
  end
end
