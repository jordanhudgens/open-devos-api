class UsersController < ApplicationController
  before_action :set_user, only: [:update]
  skip_before_action :authenticate_user, only: [:profile]

  def update
    puts "UPDATE PARAMS" * 100, @current_user.id, "user_params" * 100, params[:id], "END" * 100
    raise NotAuthorizedException unless @current_user.id == params[:id]

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def profile
    user = User.find_by_slug(params[:user_slug])

    if user
      @plans = user.plans
      render json: @plans
    else
      render json: 'Could not find user', status: :unprocessable_entity
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :slug,
        :full_name,
        :avatar
      )
    end
end
