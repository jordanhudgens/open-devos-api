class UsersController < ApplicationController
  skip_before_action :authenticate_user

  def profile
    user = User.friendly.find(params[:id])

    if user
      @plans = user.plans
      render json: @plans
    else
      render json: 'Could not find user', status: :unprocessable_entity
    end
  end
end
