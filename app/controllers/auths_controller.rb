class AuthsController < ApplicationController
  skip_before_action :authenticate_user

  def register
    puts "Y" * 500, params.inspect
    user = User.create!(
      email: params.slice(:user),
      password: params.slice(:password),
      password_confirmation: params.slice(:password_confirmation)
    )

    puts "Z" * 500, user.inspect

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
