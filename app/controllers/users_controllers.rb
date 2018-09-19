class UsersController < ApplicationController
  include CurrentUserConcern
  before_action :set_user, only: [:update]
  skip_before_action :authenticate_user, only: [:profile]
  before_action :check_for_current_user, only: [:profile]

  def update
    raise NotAuthorizedException unless String(@current_user.id) == String(params[:id])

    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def profile
    user = User.find_by_slug(params[:user_slug])

    if user && @current_user && (@current_user.id == user.id)
      @plans = user.plans
      render json: @plans
    elsif user
      @plans = user.plans.published
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
